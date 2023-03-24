//
//  CharacterView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

struct CharacterView: View {
    
    var characterData : CharacterModel
    
    @State private var name : String = ""
    @State private var gender : String = ""
    
    @State var isDetailsOn : Bool = false
    @State private var setColor: Color = Color.white
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                setColor
                    .opacity(0.6)
                HStack(spacing:10){
                    
                    AsyncImage(url: URL(string: characterData.image)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 150)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                    Text("\(name)")
                        .font(.custom("Avenir", size: 36))
                        .padding(.trailing)
                }
                .onTapGesture {
                    isDetailsOn.toggle()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.width * 0.95, height: 150)
        .border(.black)
        .onAppear(){
            name = characterData.name
            
            switch characterData.gender{
                
                case "Female":
                    setColor = Color.pink
                case "Male":
                    setColor = Color.cyan
                case "unknown":
                    setColor = Color.secondary
                    
            default:
                setColor = Color.white
            }
        }
        
        .navigationDestination(isPresented: $isDetailsOn){
            DetailsView(characterData: characterData)
        }
    }
}

struct ReversedCharacterView : View {
    
    var characterData : CharacterModel
    @State private var name : String = ""
    @State private var gender : String = ""

    @State var isDetailsOn : Bool = false
    @State private var setColor: Color = Color.white
    
    var body : some View {
        
        NavigationStack{
            ZStack{
                setColor
                    .opacity(0.6)
                HStack(spacing: 10){
                    Text("\(name)")
                        .font(.custom("Avenir", size: 36))
                        .padding(.leading)
                    Spacer()
                    AsyncImage(url: URL(string: characterData.image)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(.leading)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .onTapGesture {
                    isDetailsOn.toggle()
                    gender = characterData.gender
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.width * 0.95, height: 150)
        .border(.black)
        .onAppear(){
            name = characterData.name
            
            switch characterData.gender{
                
                case "Female":
                    setColor = Color.pink
                case "Male":
                    setColor = Color.cyan
                case "unknown":
                    setColor = Color.secondary
                    
            default:
                setColor = Color.white
            }
        }
        
        .navigationDestination(isPresented: $isDetailsOn){
            DetailsView(characterData: characterData)
        }
    }
}
