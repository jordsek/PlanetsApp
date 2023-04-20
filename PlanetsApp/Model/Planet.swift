//
//  Planet.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import Foundation

struct Planet: Decodable{
    let results: [Result]
}

struct Result: Decodable, Identifiable{
    let id = UUID()
    let name: String
}
