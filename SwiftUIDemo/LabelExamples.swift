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
            Label("Books", systemImage: "books.vertical.fill")
            
            // You can use whatever views you like for the lable and icon:
            Label(title: { Button("Print Greeting") { print("hello world!")} },
                  icon: { Circle().frame(width: 20, height: 20).foregroundColor(.yellow) })
            
            // Apply label styles:
            Label("Title Only", systemImage: "globe")
                .labelStyle(TitleOnlyLabelStyle())
            Label("No title", systemImage: "eyes")
                .labelStyle(IconOnlyLabelStyle())
            
            // Use a custum lable style:
            Label("Website", systemImage: "globe")
                .labelStyle(MyCustomLabelStyle())
        }
    }
}

struct LableExample_Previews: PreviewProvider {
    static var previews: some View {
        LabelExamples()
    }
}
