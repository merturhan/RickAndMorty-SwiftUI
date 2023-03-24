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
    
    var body: some View {
        
        
        
        HStack{
            
            AsyncImage(url: URL(string: characterData.image)) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.leading)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
            Text("\(name)")
                .font(.custom("Avenir", size: 36))
                .bold()
                .padding(.trailing)
        }.frame(width: UIScreen.main.bounds.size.width, height: 150)
            .border(.black)
            .onAppear(){
                name = characterData.name
            }
        
        
        
    }
}

struct ReversedCharacterView : View {
    
    var characterData : CharacterModel
    @State private var name : String = ""
    
    var body : some View {
        
        
        HStack{
            Text("\(name)")
                .font(.custom("Avenir", size: 36))
                .bold()
                .padding(.trailing)
            Spacer()
            AsyncImage(url: URL(string: characterData.image)) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.leading)
            } placeholder: {
                ProgressView()
            }
            
        }.frame(width: UIScreen.main.bounds.size.width, height: 150)
            .border(.black)
            .onAppear(){
                name = characterData.name
            }
        
        
    }
}

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView(characterData: CharacterModel())
//    }
//}
