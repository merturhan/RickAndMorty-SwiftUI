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
    
    @State private var isFirstLaunch : Bool = true
    @State private var isActiveSplashScreen: Bool = true
    @State private var isNavigationViewStart : Bool = false
    
    var body: some View {
        
        
        ZStack{
            //SplashScreenView
            if(isActiveSplashScreen){
                if(decider.isEmpty){
                    SplashScreenView(splashScreenText: "Welcome!")
                }else{
                    if(decider.first!.isFirstLaunch == false){
                        SplashScreenView(splashScreenText: "Hello!")
                    }
                }
            }
            
            //After SplashScreenView
            else{
                EmptyView()
            }
        }
        //SplashScreenView countdown
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2.5){
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
        MainView()
    }
}
