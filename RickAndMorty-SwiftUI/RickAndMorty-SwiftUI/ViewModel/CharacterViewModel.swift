//
//  CharacterViewModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation

@MainActor
class CharacterViewModel : ObservableObject{
    
    @Published var characters : [CharacterModel] = []
    
    public func getCharacters(locationID: Int, lvm : LocationViewModel) async throws {
        characters.removeAll()
        for charURL in lvm.locations[locationID].residents{
            
            guard let url = URL(string: charURL) else{
                fatalError("Wrong URL")
            }
            let urlRequest = URLRequest(url: url)
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                fatalError("Error, data couldn't fetched")
            }
            let characterData = try JSONDecoder().decode(CharacterModel.self, from: data)
            characters.append(characterData)
        }
    }
    
}
