//
//  AnswerView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import SwiftUI

struct AnswerView: View {
    @Binding var question: String
    @Binding var memes: [Meme]
    
    @State private var selectedMemeIndex: Int? = nil
    @State private var imagesUrls: [String] = []
    @State private var imageOpacities: [Double] = [0.0, 0.0, 0.0]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            if !memes.isEmpty {
                HStack {
                    ForEach(0..<imagesUrls.count, id: \.self) { index in
                        ImageButtonView(selectedMemeIndex: $selectedMemeIndex, imagesUrls: $imagesUrls, imageOpacities: $imageOpacities, index: index)
                    }
                }
            } else {
                Text("No images available")
            }
            
            HStack {
                Button {
                    selectedMemeIndex = nil
                    imageOpacities = [0.0, 0.0, 0.0]
                    imagesUrls = Array(memes.shuffled().prefix(3).map { $0.url })
                } label: {
                    Text("👎")
                        .gradeButton()
                }
                
                Button {
                    dismiss()
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
}
