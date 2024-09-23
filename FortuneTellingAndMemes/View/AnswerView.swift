//
//  AnswerView.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import SwiftUI

struct AnswerView: View {
    @Binding var question: String
    
    var body: some View {
        VStack {
            Spacer()
            GeometryReader { geometry in
                Image(.mockImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(height: UIScreen.main.bounds.width - 80)
            
            Spacer()
            
            HStack {
                Button {
                    //
                } label: {
                    Text("👎")
                        .gradeButton()
                }
                
                Button {
                    //
                } label: {
                    Text("👍")
                        .gradeButton()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .clipped()
        .navigationTitle(question)
    }
}
