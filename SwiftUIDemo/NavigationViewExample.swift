//
//  NavigationViewExample.swift
//  SwiftUIDemo
//
//  Created by David Crooks on 18/04/2021.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        NavigationView() {
            VStack(spacing:20) {
                NavigationLink("Text Examples", destination: TextExamples())
                NavigationLink("Button Examples", destination: ButtonExamples())
                NavigationLink(
                 destination:LabelExamples()){
                    Label("Label Examples", systemImage: "bookmark")
                }
                NavigationLink("Shape Examples", destination: ShapeExamples())
            }
        }
    }
}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
