//
//  NetworkError.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
