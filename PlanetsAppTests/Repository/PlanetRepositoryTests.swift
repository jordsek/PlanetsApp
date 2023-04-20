//
//  PlanetRepositoryTests.swift
//  PlanetsAppTests
//
//  Created by Jor . on 19/04/2023.
//

import XCTest
@testable import PlanetsApp

final class PlanetRepositoryTests: XCTestCase {
        
    var fakeNetworkManager: FakeNetworkManager!
    var planetRepositoryImplementation: PlanetRepositoryImplementation!
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        planetRepositoryImplementation = PlanetRepositoryImplementation(networkManager: fakeNetworkManager)
    }
    
    override func tearDownWithError() throws {
        planetRepositoryImplementation = nil
    }
    
    func test_when_get_planets_Array_susccesseds() async{
        
        let arr = try! await planetRepositoryImplementation.getPlanets(url: URL(string: "PlanetSampleTestFile")!)
        
            XCTAssertNotNil(arr)
            XCTAssertEqual(arr.results.count, 10)
        //XCTAssertEqual(arr.results.first, "count")
    }
    
    func test_get_planet_list_faile() async throws{
        let list = try? await planetRepositoryImplementation.getPlanets(url: URL(string: "PlanetSampleNodata")!)
        XCTAssertNil(list)
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
