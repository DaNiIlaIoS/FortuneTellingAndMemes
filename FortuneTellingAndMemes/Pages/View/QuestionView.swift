//
//  ContentView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var viewModel = QuestionViewModel()
    @StateObject private var coreManager = CoreDataManager()
    
    @State private var question = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mainBG
                
                VStack(spacing: 30) {
                    TextField("Enter your question", text: $question)
                        .padding()
                        .background(.secondary.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    NavigationLink {
                        AnswerView(coreManager: coreManager, question: $question, memes: $viewModel.memes)
                    } label: {
                        Text("Get fortune 🤪!")
                            .padding()
                            .font(.title.bold())
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(question.isEmpty ? 0.5 : 1)
                    }
                    .disabled(viewModel.isLoading || question.isEmpty)

                }
                .padding(.horizontal, 20)
                .navigationTitle("Fortune Telling")
                .toolbar {
                    NavigationLink("History") {
                        HistoryView(coreManager: coreManager)
                    }
                }
                .onAppear {
                    question = ""
                    viewModel.fetchMemes()
                }
            }
            .ignoresSafeArea()
        }
    }
}
