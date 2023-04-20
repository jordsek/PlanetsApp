//
//  FakeNetworkManager.swift
//  PlanetsAppTests
//
//  Created by Jor . on 19/04/2023.
//

import Foundation
@testable import PlanetsApp
//
class FakeNetworkManager: Fetchable{
    func getDataFromAPI(url: URL) async throws -> Data {
        do{
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json")else {
                            throw NetworkError.invalidURL
                        }
            let data = try Data(contentsOf: path)
            return data
        }catch{
            
            throw NetworkError.dataNotFound
        }


    }
}
