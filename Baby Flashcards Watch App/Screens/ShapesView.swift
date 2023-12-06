//
//  ShapesView.swift
//  Baby Flashcards Watch App
//
//  Created by Gonçalo Montes Palma on 29/08/2023.
//

import SwiftUI

struct ShapesView: View {
    let shapes: [String: AnyView] = [
        "square" : AnyView(SquareView()),
        "circle" : AnyView(CircleView()),
        "triangle" : AnyView(TriangleView()),
        "pentagon" : AnyView(PentagonView()),
        "hexagon" : AnyView(HexagonView()),
    ]
    
    var body: some View {
        RotatingView(views: shapes.values.map { $0 }, keys: shapes.keys.map { $0 })
    }
}


struct SquareView: View {
    var body: some View {
        Rectangle()
            .fill(.red)
            .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100) // adjust size as needed
    }
}

struct CircleView: View {
    var body: some View {
        Circle()
            .fill(.yellow)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100) // adjust size as needed
    }
}

struct TriangleView: View {
    var body: some View {
        Triangle()
            .fill(.green)
            .overlay(Triangle().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100) // adjust size as needed
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

struct PentagonView: View {
    var body: some View {
        Pentagon()
            .fill(.cyan)
            .overlay(Pentagon().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100) // adjust size as needed
    }
}

struct HexagonView: View {
    var body: some View {
        Hexagon()
            .fill(.orange)
            .overlay(Hexagon().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100) // adjust size as needed
    }
}

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        let verticeCount = 6
        return polygonPath(in: rect, vertices: verticeCount)
    }
}

func polygonPath(in rect: CGRect, vertices: Int) -> Path {
    guard vertices >= 3 else {
        return Path()
    }
    
    let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
    var path = Path()
    let angle = 2 * .pi / CGFloat(vertices)
    
    for i in 0..<vertices {
        let x = center.x + rect.width / 2 * cos(angle * CGFloat(i) - .pi / 2)
        let y = center.y + rect.height / 2 * sin(angle * CGFloat(i) - .pi / 2)
        let point = CGPoint(x: x, y: y)
        
        if i == 0 {
            path.move(to: point)
        } else {
            path.addLine(to: point)
        }
    }
    path.closeSubpath()
    
    return path
}



struct Pentagon: Shape {
    func path(in rect: CGRect) -> Path {
        let verticeCount = 5
        return polygonPath(in: rect, vertices: verticeCount)
    }
}




struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
