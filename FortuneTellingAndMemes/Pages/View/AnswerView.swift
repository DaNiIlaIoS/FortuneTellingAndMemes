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
    
    @State private var imageUrl = ""
    @State private var imageOpacity = 0.0
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            if !memes.isEmpty {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(imageOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                imageOpacity = 1
                            }
                        }
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 2)
                }
                .id(imageUrl)
            } else {
                Text("No images available")
            }
            
            Spacer()
            
            HStack {
                Button {
                    imageOpacity = 0
                    withAnimation {
                        imageUrl = memes.randomElement()?.url ?? ""
                    }
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
            Spacer()
        }
        .padding(.horizontal, 40)
        .navigationTitle(question)
        .onAppear {
            imageUrl = memes.randomElement()?.url ?? ""
        }
    }
}
