//
//  NavigationButton.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct NavigationButton: View {
    var emoji: String
    var text: String
    var color: Color
    
    var body: some View {
        VStack {
            Text(text).font(.system(size: 20, weight: .bold, design: .rounded))
            
            Text(emoji).font(.system(size: 40, weight: .heavy, design: .rounded))
            
        }.padding()
            .frame(maxWidth: .infinity) // This will make the button expand horizontally
        
            .background(LinearGradient(gradient: Gradient(colors: [ color.opacity(0.8), color.opacity(0.4),]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(12.0)
            .foregroundColor(.white)
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(
            emoji: "🦔",
            text: "Animals",
            color: .red
        )
    }
}
