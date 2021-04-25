//
//  TextExample.swift
//  SwiftUIDemo
//
//  Created by David Crooks on 02/03/2021.
//

import SwiftUI

struct SimpleTextExample: View {
    var body: some View {
        Text("Omnia disce")
            .font(.largeTitle)
            .foregroundColor(Color.blue)
    }
}

struct ItalicExample: View {
    var body: some View {
        Text("Italic")
           .italic()
    }
}

struct AddTextExample:View {
    var body: some View {
        // Text views can be added together!
        
        Text("Strikethrough ")
            .strikethrough()
            .foregroundColor(Color.red)
            
        + Text("offset")
            .baselineOffset(10.0)
            .foregroundColor(Color.yellow)
            
        +  Text(" underlined")
            .underline()
                
    }
}



struct StrikethroughExample: View {
    var body: some View {
        Text("Strikethrough ")
            .strikethrough()
            
        +  Text("Underlined ")
            .underline()
    }
}

struct KerningExample: View {
    var body: some View {
        //Kerning controls the spacing between letters
        Text("Spaced Out")
            .kerning(10.0)
    }
}



// To add a custom font to your app
//1) Add the font file to your project and make sure that it is a target member of your app.
//2) Register the font in you info.plist with the "Font Provided By Application" key

// see here for details: https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app

struct CustomTextExample:View {
    var body: some View {
        Text("Swift UI ").font(.custom("CartoonBlocksChristmas", size: 36))
    }
}

struct TextExamples: View {
    var body: some View {
        VStack(spacing:20) {
            SimpleTextExample()
            KerningExample()
            AddTextExample()
            ItalicExample()
            CustomTextExample()
            
            NavigationLink("See all available fonts", destination:AllFontsListExample())
        }
    }
}


struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExamples()
    }
}
