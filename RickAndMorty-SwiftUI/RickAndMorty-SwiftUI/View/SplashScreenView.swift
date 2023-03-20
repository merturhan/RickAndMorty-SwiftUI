//
//  BackgroundView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    var splashScreenText : String
    
    var body: some View {
        
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 275, height: 275)
                .padding(.vertical, 20)
                .padding(.horizontal,50)
            Text(splashScreenText)
                .font(.custom("Avenir", size: 36))
                .bold()
            ProgressView()
                .progressViewStyle(.circular)
        }
            
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(splashScreenText: "Welcome!")
    }
}
