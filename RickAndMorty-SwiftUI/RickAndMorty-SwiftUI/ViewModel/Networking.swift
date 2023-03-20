//
//  Networking.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation

class Networking{
    
    var baseURL : String = "https://rickandmortyapi.com/api/"
    
    func performAPIRequestByMethod(method: String) async throws -> Data {
        if let url = URL(string: baseURL+method) {
            print("📮 RequestURL: \(baseURL)\(method)")
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
               let error: ResponseErrorMessage = try decodeJSONData(data: data)
               throw NetworkHandlerError.RequestError(error.error)
            }
            return data
        } else {
            throw(NetworkHandlerError.InvalidURL)
        }
    }
    
    func decodeJSONData<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkHandlerError.JSONDecodingError
        }
    }
    
}
