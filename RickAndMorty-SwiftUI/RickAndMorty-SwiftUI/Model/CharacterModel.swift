//
//  CharacterModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation

public struct CharacterModel : Identifiable, Codable{
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: OriginModel
    public let location: LocationModell
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    
    
}
public struct OriginModel: Codable {
    public let name: String
    public let url: String
}

public struct LocationModell : Codable {
    public let name : String
    public let url : String
}


