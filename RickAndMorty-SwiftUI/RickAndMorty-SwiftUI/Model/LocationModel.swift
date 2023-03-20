//
//  LocationModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation

struct LocationModel : Codable, Identifiable{
    public let id : Int
    public let name : String
    public let type :String
    public let dimension : String
    public let residents : [String]
    public let url : String
    public let created : String
}
