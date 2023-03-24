//
//  HomeScreen.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var lvm : LocationViewModel
    @ObservedObject var cvm : CharacterViewModel
    @State private var locationID : Int = 0
    @State var counter = 0
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(lvm.locations){locationData in
                        Button("\(locationData.name)"){
                            locationID = locationData.id
                            counter = 0
                            Task{
                                do{
                                    try await cvm.getCharacters(locationID: locationID-1, lvm: lvm)
                                }catch{
                                    print("Error while fetching in HScrollView")
                                }
                            }
                            
                        }.buttonStyle(.bordered)
                            .foregroundColor(.black)
                        
                    }
                }
            }.padding()
            
            
            ScrollView{
                
                if(cvm.characters.isEmpty){
                    EmptyView()
                    
                }else{
                    
                    ForEach(Array(cvm.characters.enumerated()), id:\.offset) {index, ch in
                        if(index % 2 == 0){
                            CharacterView(characterData: ch)
                        }
                        else{
                            ReversedCharacterView(characterData: ch)
                        }
                    }
                }
                
                
            }.toolbar{
                ToolbarItem(placement : .automatic){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        
    }
    
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(lvm: LocationViewModel(), cvm: CharacterViewModel())
    }
}

