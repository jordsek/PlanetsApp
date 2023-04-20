//
//  PlanetsAppApp.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import SwiftUI

@main
struct PlanetsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            PlanetsListView(viewModel: PlanetListViewModel(repository: PlanetRepositoryImplementation(networkManager: NetworkManager()))).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
