//
//  HistoryView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 25.09.2024.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var coreManager: CoreDataManager
    
    var body: some View {
        List {
            ForEach(coreManager.answers) { answer in
                VStack {
                    HStack {
                        Text(answer.question ?? "")
                            .font(.headline)
                        Spacer()
                        Text(answer.date ?? Date(), style: .time)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    AsyncImage(url: URL(string: answer.memeUrl ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }

                }
            }
            .onDelete(perform: deleteAnswer)
        }
        .scrollContentBackground(.hidden) // Скрываем стандартный фон
        .background(.mainBG)
        .navigationTitle("History")
        .toolbar {
            EditButton()
        }
        .onAppear {
            coreManager.fetchAnswers()
        }
    }
    
    func deleteAnswer(offsets: IndexSet) {
        offsets.map { coreManager.answers[$0] }.forEach { answer in
            answer.deleteAnswer()
        }
    }
}
