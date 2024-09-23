//
//  ContentView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import SwiftUI

struct QuestionView: View {
    @State private var question = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                TextField("Enter your question", text: $question)
                    .padding()
                    .background(.secondary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            
                NavigationLink {
                    //
                } label: {
                    Text("Get fortune 🤪!")
                        .padding()
                        .font(.title.bold())
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }

            }
            .padding(.horizontal, 20)
            .navigationTitle("Fortune Telling")
        }
    }
}

#Preview {
    QuestionView()
}
