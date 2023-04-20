//
//  PlanetRepostory.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import Foundation

protocol PlanetRepostory {
    func getPlanets(url: URL) async throws -> Planet
}
