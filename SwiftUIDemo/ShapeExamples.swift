//
//  ShapeExample.swift
//  SwiftUIDemo
//
//  Created by David Crooks on 24/04/2021.
//

import SwiftUI

struct Star:Shape {
    let numberOfPoints:Int
    let innerRadiusRatio:CGFloat
    
    private func starVertices(numberOfPoints:Int, in rect:CGRect) -> [CGPoint] {
        let radius = 0.5 * min(rect.size.width,rect.size.height)
        let center = CGPoint(x: rect.midX,y: rect.midY)
        let alpha = CGFloat.pi / CGFloat(numberOfPoints)
        let innerRadius = radius * innerRadiusRatio
        let numVertex =  2 * numberOfPoints;
        
        func vertex(at i:Int ) -> CGPoint {
            let angle = (CGFloat( i) - 0.5) * alpha
            let r = i.isMultiple(of: 2) ? radius : innerRadius
            return CGPoint(x:center.x + r*cos(angle), y: center.y + r*sin(angle))
        }
        
        return (0..<numVertex).map(vertex)
    }
    
    func path(in rect: CGRect) -> Path {
        let points = starVertices(numberOfPoints:numberOfPoints, in:rect)
        
        var path =  Path()
        
        path.move(to: points.last!)
        
        points.forEach{
            path.addLine(to: $0)
        }
        
        return path
    }
}


struct ShapeExamples: View {
    var body: some View {
        Star(numberOfPoints:5, innerRadiusRatio: 1/2)
    }
}

struct ShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExamples()
    }
}
