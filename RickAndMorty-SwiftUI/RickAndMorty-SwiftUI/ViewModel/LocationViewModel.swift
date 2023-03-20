//
//  LocationViewModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation

class LocationViewModel : ObservableObject {
    
    @Published var locations : [LocationModel] = []
    
    public func getAllLocations() async throws {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/locations") else{
            fatalError("Wrong URL")
        }
        let urlRequest = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error, data couldn't fetched")
        }
        
        let locationData = try JSONDecoder().decode([LocationModel].self, from: data)
        locationData.forEach { ld in
            self.locations.append(ld)
        }
    }
    
    public func printAllLocations(){
        if(!locations.isEmpty){
            for location in locations{
                print(location.name)
            }
        }
    }
}
