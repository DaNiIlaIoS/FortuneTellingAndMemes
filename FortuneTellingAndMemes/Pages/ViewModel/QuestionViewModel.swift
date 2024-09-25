//
//  QuestionViewModel.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import Foundation

@MainActor
final class QuestionViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var memes: [Meme] = []
    @Published var isLoading = true
    
    func fetchMemes() {
        Task {
            memes = try await networkManager.getMemes()
            isLoading = false
        }
    }
}
