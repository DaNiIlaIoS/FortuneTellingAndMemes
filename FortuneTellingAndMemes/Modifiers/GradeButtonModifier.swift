//
//  GradeButtonModifier.swift
//  FortuneTellingAndMemes
//
//  Created by Даниил Сивожелезов on 23.09.2024.
//

import SwiftUI

struct GradeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.3))
            .font(.largeTitle)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
