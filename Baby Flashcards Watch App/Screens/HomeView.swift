//
//  HomeView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AlphabetView()) {
                    NavigationButton(
                        emoji: "🔠",
                        text: "Alphabet",
                        color: .cyan
                    )
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: ColorView()) {
                    NavigationButton(
                        emoji: "🔢",
                        text: "Numbers",
                        color: .blue
                    )
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: AnimalView()) {
                    NavigationButton(
                        emoji: "🦔",
                        text: "Animals",
                        color: .green
                    )
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: ColorView()) {
                    NavigationButton(
                        emoji: "🎨",
                        text: "Colors",
                        color: .purple
                    )
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: ColorView()) {
                    NavigationButton(
                        emoji: "🔷",
                        text: "Shapes",
                        color: .orange
                    )
                    
                }
                .buttonStyle(PlainButtonStyle())
                
                
            }.navigationTitle("FlashBaby")
        }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
