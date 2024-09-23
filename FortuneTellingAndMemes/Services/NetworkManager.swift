//
//  NetworkManager.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import Foundation

final class NetworkManager {
    
    func getMemes() async throws -> [Meme] {
        guard let url = URL(string: "https://api.imgflip.com/get_memes") else { throw NetworkError.invalidURL}
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let model = try JSONDecoder().decode(MemesData.self, from: data)
            return model.data.memes
        } catch {
            throw NetworkError.decodingError
        }
    }
    
//    func getImage(from stringUrl: String) async throws -> Data {
//        guard let url = URL(string: stringUrl) else { throw NetworkError.invalidURL}
//
//        let request = URLRequest(url: url)
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw NetworkError.invalidResponse
//        }
//
//        return data
//    }
}
