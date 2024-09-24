//
//  ImageButtonView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 24.09.2024.
//

import SwiftUI

struct ImageButtonView: View {
    @Binding var selectedMemeIndex: Int?
    @Binding var imagesUrls: [String]
    @Binding var imageOpacities: [Double]
    
    let index: Int
    
    var body: some View {
        Button {
            selectedMemeIndex = index
        } label: {
            if selectedMemeIndex == index {
                AsyncImage(url: URL(string: imagesUrls[index])) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(imageOpacities[index])
                        .onAppear {
                            withAnimation(.easeIn(duration: 2)) {
                                imageOpacities[index] = 1
                            }
                        }
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }

            } else if selectedMemeIndex == nil {
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}
