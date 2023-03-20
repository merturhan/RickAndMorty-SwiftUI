//
//  RickAndMorty_SwiftUIApp.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

@main
struct RickAndMorty_SwiftUIApp: App {
    
    @StateObject private var dataController = DataController()
    @StateObject private var locationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(lvm: locationViewModel).environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
