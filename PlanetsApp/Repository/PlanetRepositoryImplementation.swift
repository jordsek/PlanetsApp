//
//  PlanetRepositoryImplementation.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import Foundation

final class PlanetRepositoryImplementation: PlanetRepostory {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getPlanets(url: URL) async throws -> Planet {
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode(Planet.self, from: data)
            return result
        }catch {
            throw error
            
        }
    }
    
    
}
