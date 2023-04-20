//
//  PlanetListCoredataRepository.swift
//  PlanetsApp
//
//  Created by Jor . on 19/04/2023.
//

import Foundation
protocol PlanetListCoreDataRepository {
    
    func savePlanetList(planets: [Result]) async throws
    func getPlanetListFromDB() async throws -> [PlanetEntity]

}
