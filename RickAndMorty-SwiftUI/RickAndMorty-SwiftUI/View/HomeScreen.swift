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
    @State var isDetailsOn : Bool = false
    
    var body: some View {
        
        NavigationStack{
            
            //Horizontal ScrollView for Locations
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(lvm.locations){locationData in
                        Button("\(locationData.name)"){
                            //Save locationID for get characters
                            locationID = locationData.id
                            //Async getCharacter call
                            Task{
                                do{
                                    try await cvm.getCharacters(locationID: locationID-1, lvm: lvm)
                                }catch{
                                    print("Error while taking Characters in choosen Index")
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
                    //Enumreated for have index
                    ForEach(Array(cvm.characters.enumerated()), id:\.offset) {index, ch in
                        //We check whether the index is odd or even
                        if(index % 2 == 0){
                            CharacterView(characterData: ch)
                        }
                        else{
                            ReversedCharacterView(characterData: ch)
                        }
                    }
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

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(lvm: LocationViewModel(), cvm: CharacterViewModel())
    }
}

