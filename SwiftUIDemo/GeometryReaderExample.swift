//
//  GeometryReaderExample.swift
//  SwiftUIDemo
//
//  Created by David Crooks on 18/04/2021.
//

import SwiftUI

struct Dinosaur: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color( red: 213/255, green: 201/255, blue:237/255, opacity: 1.0))
                Text("🦖").font(.system(size: geometry.size.width * 0.7))
            }
        }
        .aspectRatio(contentMode: .fit)
    }
}

struct GeometryReaderExample: View {
    var body: some View {
        VStack {
            Dinosaur()
               .padding()
           Dinosaur()
              .padding(70)
        }
    }
}

struct GeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
