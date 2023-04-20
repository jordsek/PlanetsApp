//
//  PlanetViewModelTest.swift
//  PlanetsAppTests
//
//  Created by Jor . on 19/04/2023.
//

import XCTest
@testable import PlanetsApp
import CoreData
final class PlanetViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testGetPlanet_When_data_isCorrect() async{
        let fakePlanetRepository = FakePlanetRepository()
        let planetViewModel =   await PlanetListViewModel(repository: fakePlanetRepository)
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
