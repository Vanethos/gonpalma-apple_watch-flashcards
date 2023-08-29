//
//  ContentView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct AnimalView: View {
    
    let alphabet = Array("🦊🐮🐶🐱🐭🐴🦁🐨🐷🐧🐵🐸🐍🦀🐡🐬🐳🦭🪼🐓🦔🦥🐘🦑🐙🐛🐺🦗🐝🪱")
    
    var body: some View {
        RotatingView<Text>(views:
                            alphabet.map {
            char in Text(String(char))
                .font(.system(size: 120, weight: .heavy, design: .rounded))
        }
        )
    }
    
    
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}
