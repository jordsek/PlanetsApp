//
//  PlanetsListView.swift
//  PlanetsApp
//
//  Created by Jor . on 18/04/2023.
//

import SwiftUI
import CoreData
struct PlanetsListView: View {
    
    @Environment (\.managedObjectContext) var context
    
    @FetchRequest(entity: PlanetEntity.entity(), sortDescriptors: [])
    var dbPlanetArray: FetchedResults<PlanetEntity>
    var fetchRequest: NSFetchRequest<PlanetEntity> = PlanetEntity.fetchRequest()
    
    @StateObject var viewModel: PlanetListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.planetList.isEmpty{
                   
                    List{
                        ForEach(viewModel.planetList){ planetEntity in
                            Text(planetEntity.name )
                        }
                    }
                }else {
                    ProgressView()
                }
            }
        }
        .onAppear{
            Task{
                await viewModel.getPlanetList(urlString: APIEndPoint.PlanetsListAPIEndPoint, context: context)
            }
        }
    }
}

struct PlanetsListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsListView(viewModel: PlanetListViewModel(repository: PlanetRepositoryImplementation(networkManager: NetworkManager())))
    }
}





