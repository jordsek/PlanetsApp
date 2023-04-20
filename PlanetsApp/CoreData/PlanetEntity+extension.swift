//
//  PlanetEntity+extension.swift
//  PlanetsApp
//
//  Created by Jor . on 20/04/2023.
//

import Foundation
extension PlanetEntity {
    func toPlanet()-> Result {
        return Result(name: name ?? "")
    }
}
