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
    
    @State var imageOpacity: Double = 0
    
    let index: Int
    
    var body: some View {
        Button {
            withAnimation {
                selectedMemeIndex = index
            }
        } label: {
            if selectedMemeIndex == index {
                AsyncImage(url: URL(string: imagesUrls[index])) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(imageOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1)) {
                                imageOpacity = 1
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
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}
