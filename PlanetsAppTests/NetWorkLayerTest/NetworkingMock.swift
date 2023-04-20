//
//  NetworkingMock.swift
//  PlanetsAppTests
//
//  Created by Jor . on 19/04/2023.
//

import Foundation

@testable import PlanetsApp

class NetworkingMock: Networking {
    static var data: Data?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
    
    
}
