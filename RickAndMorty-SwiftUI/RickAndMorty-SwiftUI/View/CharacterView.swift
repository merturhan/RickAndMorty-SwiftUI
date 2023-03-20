//
//  CharacterView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

struct CharacterView: View {
    
    var characterName : String
    var imageName : String
    
    
    var body: some View {
        
        HStack{
            Rectangle()
                .frame(width: 150, height: 150)
                .padding(.leading)
            Spacer()
            Text("\(characterName)")
                .font(.custom("Avenir", size: 36))
                .bold()
                .padding(.trailing)
        }.frame(width: UIScreen.main.bounds.size.width, height: 150)
            .border(.red)
        
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(characterName: "Beth Smith", imageName: "null")
    }
}
