//
//  NumbersView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct NumbersView: View {
    let numbers = (0...9).map { String($0) }

    
    var body: some View {
        RotatingView<Text>(views:
                            numbers.map {
            char in Text(String(char))
                .font(.system(size: 120, weight: .heavy, design: .rounded))
        }
        )
    }
}

struct NumbersView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersView()
    }
}
