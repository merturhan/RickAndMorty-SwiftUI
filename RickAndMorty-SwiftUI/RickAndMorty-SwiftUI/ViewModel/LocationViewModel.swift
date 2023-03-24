//
//  LocationViewModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation

@MainActor
public class LocationViewModel : ObservableObject {
    
    @Published var locations : [LocationModel] = []
    
    public func getAllLocations() async throws {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/location/[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]") else{
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
}
