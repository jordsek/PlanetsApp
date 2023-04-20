//
//  PlanetListViewModel.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import Foundation
import CoreData
@MainActor
class PlanetListViewModel: ObservableObject, GetPlanetListRepository{
    
    @Published var planets: Planet?
    @Published var customError: NetworkError?
    @Published var planetList: [Result] = []

    let repository: PlanetRepostory
    init(repository: PlanetRepostory){
        self.repository = repository
    }
    
    func getPlanetList(urlString: String, context: NSManagedObjectContext) async{
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let planetResponse = try await repository.getPlanets(url: url)
           
            self.planets = planetResponse
            
            if !planetResponse.results.isEmpty {
                // Save to core data
                await self.saveDataIntoDB(context: context,planetsList:planetResponse.results)
                self.planetList =  planetResponse.results
            }else {
               // read from core data if api fails to return
                let coreDataRepository = PlanetListCoreDataRepositoryImplementation(context: context)

                let plantEntitys = try await coreDataRepository.getPlanetListFromDB()
                
                // Mapping core data entity to model (entity to Planet)
                let dabArray = plantEntitys.map { $0.toPlanet() }
                self.planetList =  dabArray

            }
            
        }catch let someError {
            print(someError.localizedDescription)
            if someError as? NetworkError == .dataNotFound{
                self.customError = NetworkError.dataNotFound
            }else{
                self.customError = NetworkError.parsingError
            }
        }
        
    }
    
    private func saveDataIntoDB(context: NSManagedObjectContext,planetsList:[Result]) async{
        let coreDataRepository = PlanetListCoreDataRepositoryImplementation(context: context)
        do{
            try await coreDataRepository.savePlanetList(planets: planetsList)
            print("DB Save success")
        }catch{
            print("DB Save failed")
        }
    }
}
