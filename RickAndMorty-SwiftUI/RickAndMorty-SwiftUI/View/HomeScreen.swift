//
//  HomeScreen.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
   
        ZStack{
            
            NavigationStack{
                
                ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Button("Earth (C-317)"){
                                
                            }.buttonStyle(.bordered)
                                .foregroundColor(.black)
                            Button("Earth (C-317)"){
                                
                            }.buttonStyle(.bordered)
                                .foregroundColor(.black)
                            Button("Earth (C-317)"){
                                
                            }.buttonStyle(.bordered)
                                .foregroundColor(.black)
                            Button("Earth (C-317)"){
                                
                            }.buttonStyle(.bordered)
                                .foregroundColor(.black)
                        }
                }.padding()
                
                ScrollView{
                    VStack{
                        Text("asdasd")
                        Text("asdasd")
                        Text("asdasd")
                    }
                    
                }
                
                    .toolbar{
                        ToolbarItem(placement : .automatic){
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                
                
            }
            
        }
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

