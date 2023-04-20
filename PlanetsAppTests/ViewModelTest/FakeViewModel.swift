//
//  FakeViewModel.swift
//  PlanetsAppTests
//
//  Created by Jor . on 20/04/2023.
//

import Foundation
@testable import PlanetsApp
class FakeViewModel: ObservableObject{
    
    @Published var planets: Planet?
    @Published var customError: NetworkError?
    @Published var planetList: [Result] = []
    
    let repository: PlanetRepostory
    init(repository: PlanetRepostory){
        self.repository = repository
    }
    
    func getPlanetList(urlString: String) async{
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let result = try await repository.getPlanets(url: url)
            DispatchQueue.main.async { [self] in
                self.planetList = planetList
                //print(characterArray)
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
    
}
