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
    
    init(numberOfPoints:Int) {
        //A bit of trigonometry
        // We can calculate a special ratio between the inner and outer radius, such that different points of the star appear to be conected by strait lines.
        // Then concider the triangle made from the point of the star, an inner point and the center.
        // The angles are:
        let alpha = CGFloat.pi / CGFloat(numberOfPoints)
        let beta = 0.5 * CGFloat.pi + alpha
        let gamma = 0.5 * CGFloat.pi - 2.0 * alpha
        
        // We can now calculate the ratio from the sine rule for triangles:
        innerRadiusRatio = sin(gamma) / sin(beta)
        print(innerRadiusRatio)
        self.numberOfPoints = numberOfPoints
    }
    
    init(numberOfPoints:Int,innerRadiusRatio:CGFloat) {
        self.numberOfPoints = numberOfPoints
        self.innerRadiusRatio = innerRadiusRatio
    }
    
    private func starVertices(numberOfPoints:Int, in rect:CGRect) -> [CGPoint] {
        let radius = 0.5 * min(rect.size.width,rect.size.height)
        let center = CGPoint(x: rect.midX,y: rect.midY)
        let alpha = CGFloat.pi / CGFloat(numberOfPoints)
        let innerRadius = radius * innerRadiusRatio
        let numVertex =  2 * numberOfPoints;
        
        func vertex(at i:Int ) -> CGPoint {
            // An angle of zero is pointing off to the right, but we would like to start at the top.
            let offsetAngle = -0.5 * CGFloat.pi
            
            let angle = offsetAngle + (CGFloat( i) ) * alpha
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
        HStack {
            Star(numberOfPoints:5)
                .foregroundColor(.blue)
            Star(numberOfPoints:6)
                .foregroundColor(.blue)
            Star(numberOfPoints:7)
                .foregroundColor(.blue)
            Star(numberOfPoints:7,innerRadiusRatio: 0.3)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct ShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExamples()
    }
}
