//
//  PlanetViewModelTest.swift
//  PlanetsAppTests
//
//  Created by Jor . on 19/04/2023.
//

import XCTest
@testable import PlanetsApp
import CoreData
@MainActor
final class PlanetViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testGetPlanet_When_data_isCorrect() async {
        let fakePlanetRepository = FakePlanetRepository()
        let fakeViewmodel =   await FakeViewModel(repository: fakePlanetRepository)
        
        await fakeViewmodel.getPlanetList(urlString: "PlanetSampleTestFile")
        let planetArray = fakeViewmodel.planetList
        XCTAssertNotNil(planetArray)
       
    }
    
    //when url is incorrect, it will return immediately, no data in PlanetArray
    func test_getPlanetList_When_Url_isNotGiven() async {
        

        let fakePlanetRepository = FakePlanetRepository()
        let fakeViewmodel =   await FakeViewModel(repository: fakePlanetRepository)
        
        await fakeViewmodel.getPlanetList(urlString: "")
        let planetArray = fakeViewmodel.planetList
        let localError =  fakeViewmodel.customError
        XCTAssertEqual(planetArray.count,0)

    }
    
    func testGetPlanetList_when_APIFails() async{
        let fakePlanetRepository = FakePlanetRepository()
        let fakeViewmodel =   await FakeViewModel(repository: fakePlanetRepository)

        XCTAssertNotNil(fakeViewmodel)

        await fakeViewmodel.getPlanetList(urlString: "PlanetSampleTestFile")

        let planetArray = fakeViewmodel.planetList
        XCTAssertEqual(planetArray.count, 0)
    }
    
    func testGetEmployeeList_When_URL_is_Incorrect() async{
        let fakePlanetRepository = FakePlanetRepository()
        let fakeViewmodel =   await FakeViewModel(repository: fakePlanetRepository)

        XCTAssertNotNil(fakeViewmodel)

        await fakeViewmodel.getPlanetList(urlString: "CharacterSampleTestFileWrongURL")

        let planetArray = fakeViewmodel.planetList
        XCTAssertEqual(planetArray.count, 0)
        

    }


}
