//
//  Fetchable.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import Foundation

protocol Fetchable {
    func getDataFromAPI(url: URL) async throws -> Data
}
