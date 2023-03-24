//
//  ContentView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    var decider : FetchedResults<Decider>
    
    
    @ObservedObject var lvm : LocationViewModel
    @ObservedObject var cvm : CharacterViewModel
    
    @State private var isFirstLaunch : Bool = true
    @State private var isActiveSplashScreen: Bool = true
    
    
    
    var body: some View {
        
        
        ZStack{
            
            //SplashScreenView
            if(isActiveSplashScreen){
                if(decider.isEmpty){
                    SplashScreenView(splashScreenText: "Welcome!")
                        .task {
                            do{
                                //Request for all locations and characters which are in the first location
                                try await lvm.getAllLocations()
                                try await cvm.getCharacters(locationID: 0, lvm: lvm)
                            }catch{
                                print("error")
                            }
                        }

                }else{
                    if(decider.first!.isFirstLaunch == false){
                        SplashScreenView(splashScreenText: "Hello!")
                            .task {
                                do{
                                    //Take all items in first scene
                                    try await lvm.getAllLocations()
                                    try await cvm.getCharacters(locationID: 0, lvm: lvm)
                                }catch{
                                    print("error")
                                }
                            }
                    }
                }
            }
            //After SplashScreenView
            else{
                HomeScreen(lvm: lvm, cvm: cvm)
            }
        }
        
        //SplashScreenView countdown
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation {
                    self.isActiveSplashScreen = false
                    if(decider.isEmpty){
                        DataController().addDecider(context: viewContext)
                    }
                }
            }
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(lvm: LocationViewModel(), cvm: CharacterViewModel())
    }
}
