//
//  ColorView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 28/08/2023.
//

import SwiftUI

struct ColorView: View {
    let colors: [String: Color] = [
        "red" : .red,
        "orange" : .orange,
        "yellow" : .yellow,
        "green" : .green,
        "blue" : .blue,
        "purple" : .purple,
        "pink" : .pink,
        "brown" : .brown,
        "grey" : .gray,
        "black" : .black,
        "white" : .white,
    ]
    
    var body: some View {
        RotatingView(views: colors.values.map { color in
            AnyView(Rectangle().fill(color).edgesIgnoringSafeArea(.all))
        }, keys: Array(colors.keys))
    }
}
struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
