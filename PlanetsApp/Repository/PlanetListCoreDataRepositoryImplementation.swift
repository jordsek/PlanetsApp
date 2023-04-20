//
//  PlanetListCoreDataRepositoryImplementation.swift
//  PlanetsApp
//
//  Created by Jor . on 19/04/2023.
//

import Foundation
import CoreData

final class PlanetListCoreDataRepositoryImplementation: PlanetListCoreDataRepository{
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func savePlanetList(planets: [Result]) async throws {
        planets.forEach{ planet in
            let entity = PlanetEntity(context: self.context)
            entity.name = planet.name
            
        }
        do{
            try context.save()
        }catch let error {
            print(error.localizedDescription)
            throw CoreDataError.savingError
        }
    }
    
    func getPlanetListFromDB() async throws -> [PlanetEntity] {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<PlanetEntity> = PlanetEntity.fetchRequest()

        do {
            // Peform Fetch Request
            let productsList = try context.fetch(fetchRequest)
            print(productsList)
            return productsList
        } catch {
            print("Unable to Fetch Workouts, (\(error))")
            throw CoreDataError.gettingError
        }

    }
    
    
}
