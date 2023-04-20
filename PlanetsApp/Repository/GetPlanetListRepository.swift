//
//  GetPlanetListRepository.swift
//  PlanetsApp
//
//  Created by Jor . on 19/04/2023.
//

import Foundation
import CoreData

protocol GetPlanetListRepository{
    
    func getPlanetList(urlString: String,context: NSManagedObjectContext) async
}
