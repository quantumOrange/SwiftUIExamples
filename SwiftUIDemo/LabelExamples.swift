//
//  LableExample.swift
//  SwiftUIDemoApp
//
//  Created by David Crooks on 02/03/2021.
//

import SwiftUI

struct MyCustomLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .padding(2)
            configuration.title
        }
        .padding()
        .background( Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(15)
    }
}


struct LabelExamples: View {
    var body: some View {
        VStack(spacing:20) {
            Label("Something", systemImage: "globe")
            
            
            Label(title: { Button("Say Hello!") { print("hello world!")} },
                  icon: { Circle().frame(width: 20, height: 20).foregroundColor(.yellow) })
            
            // Apply label styles:
            Label("Something", systemImage: "globe")
                .labelStyle(TitleOnlyLabelStyle())
            Label("Something", systemImage: "globe")
                .labelStyle(IconOnlyLabelStyle())
            Label("Something", systemImage: "globe")
                .labelStyle(MyCustomLabelStyle())
        }
    }
}

struct LableExample_Previews: PreviewProvider {
    static var previews: some View {
        LabelExamples()
    }
}
