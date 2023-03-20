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
    
    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
