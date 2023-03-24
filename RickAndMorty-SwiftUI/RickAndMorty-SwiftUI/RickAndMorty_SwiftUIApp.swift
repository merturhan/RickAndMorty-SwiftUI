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
    @StateObject private var characterViewModel = CharacterViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(lvm: locationViewModel,cvm: characterViewModel).environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
