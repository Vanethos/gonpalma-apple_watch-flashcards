//
//  ContentView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct AnimalView: View {
    
    let animals = [
        "fox" : "🦊",
        "cow" : "🐮",
        "dog" : "🐶",
        "cat" : "🐱",
        "mouse" : "🐭",
        "horse" : "🐴",
        "lion" : "🦁",
        "koala" : "🐨",
        "pig" : "🐷",
        "penguin" : "🐧",
        "monkey" : "🐵",
        "frog" : "🐸",
        "snake" : "🐍",
        "crab" : "🦀",
        "fish" : "🐡",
        "dolphin" : "🐬",
        "whale" : "🐳",
        "seal" : "🦭",
        "jellyfish" : "🪼",
        "chicken" : "🐓",
        "porcupine" : "🦔",
        "sloth" : "🦥",
        "elephant" : "🐘",
        "squid" : "🦑",
        "octopus" : "🐙",
        "catterpilar" : "🐛",
        "wolf" : "🐺",
        "cricket" : "🦗",
        "bee" : "🐝",
        "worm" : "🪱",
    ]
    
    var body: some View {
        RotatingView<Text>(views:
                            animals.values.map {
            char in Text(String(char))
                .font(.system(size: 120, weight: .heavy, design: .rounded))
        }, keys: Array(animals.keys)
        )
    }
    
    
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}
