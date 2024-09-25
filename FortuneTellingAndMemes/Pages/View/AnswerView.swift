//
//  AnswerView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import SwiftUI

struct AnswerView: View {
    @ObservedObject var coreManager: CoreDataManager
    
    @Binding var question: String
    @Binding var memes: [Meme]
    
    @State private var selectedMemeIndex: Int? = nil
    @State private var imagesUrls: [String] = []
    @State private var imageOpacity: Double = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.mainBG
            
            VStack(spacing: 20) {
                
                if !memes.isEmpty {
                    HStack {
                        ForEach(0..<imagesUrls.count, id: \.self) { index in
                            ImageButtonView(selectedMemeIndex: $selectedMemeIndex, imagesUrls: $imagesUrls, index: index)
                        }
                    }
                } else {
                    Text("No images available")
                }
                
                HStack {
                    Button {
                        withAnimation {
                            selectedMemeIndex = nil
                        }
                        imagesUrls = Array(memes.shuffled().prefix(3).map { $0.url })
                    } label: {
                        Text("👎")
                            .gradeButton()
                    }
                    
                    Button {
                        if let selectedIndex = selectedMemeIndex {
                            coreManager.createAnswer(memeUrl: imagesUrls[selectedIndex], question: question)
                            dismiss()
                        }
                    } label: {
                        Text("👍")
                            .gradeButton()
                    }
                }
                .opacity(selectedMemeIndex == nil ? 0.5 : 1)
                .disabled(selectedMemeIndex == nil)

            }
            .padding(.horizontal, 40)
            .navigationTitle(question)
            .onAppear {
                imagesUrls = Array(memes.shuffled().prefix(3).map { $0.url })
            }
        }
        .ignoresSafeArea()
    }
}
