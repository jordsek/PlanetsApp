//
//  FakePlanetRepository.swift
//  PlanetsAppTests
//
//  Created by Jor . on 19/04/2023.
//

import Foundation

@testable import PlanetsApp

class FakePlanetRepository: PlanetRepostory{
    func getPlanets(url: URL) async throws -> Planet {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else
            {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            let lists = try JSONDecoder().decode(Planet.self, from: data)
            return lists
        } catch {
            print(error)
            throw NetworkError.dataNotFound
        }
    }
    
   
}
