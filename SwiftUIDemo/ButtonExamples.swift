//
//  ButtonExample.swift
//  SwiftUIDemoApp
//
//  Created by David Crooks on 02/03/2021.
//

import SwiftUI


struct TextButtonExample: View {
    var body: some View {
        Button("Touch Me!") {
            print("😏")
        }
    }
}

struct ImageButtonExample: View {
    var body: some View {
        Button(action: { print("")}) {
            Image(systemName: "ladybug")
        }
    }
}

struct BigButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View
    {
        HStack{
            Spacer()
            configuration
                .label
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .background(configuration.isPressed ? Color.black : Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(15)
    }
    
}

struct ButtonStyleExample: View {
    var body: some View {
        Button("Big Button!") {}
            .buttonStyle(BigButtonStyle())
            .padding()
    }
}

struct ButtonStyleExample2: View {
    var body: some View {
        
        Button(action:{ print("Very big!") }){
            Text("Big Button!")
        }
        .buttonStyle(BigButtonStyle())
        .padding()
    }
}



struct ButtonExamples: View {
    var body: some View {
        VStack(spacing:20) {
            TextButtonExample()
            ImageButtonExample()
            ButtonStyleExample()
            ButtonStyleExample2()
        }
    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExamples()
    }
}
