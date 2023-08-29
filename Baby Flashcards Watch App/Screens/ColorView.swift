//
//  ColorView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct ColorView: View {
    let colors: [Color] = [.green, .red, .blue, .pink, .orange, .white, .black, .yellow]
    
    var body: some View {
        RotatingView(views: colors.map { color in
            AnyView(Rectangle().fill(color).edgesIgnoringSafeArea(.all))
        })
    }
}
struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
