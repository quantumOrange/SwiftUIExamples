//
//  ListExample.swift
//  SwiftUIDemo
//
//  Created by David Crooks on 18/04/2021.
//

import SwiftUI

struct AllFontsListExample:View {
    
    let fontNames = UIFont
                     .familyNames
                     .flatMap{ UIFont.fontNames(forFamilyName:$0) }
                     .sorted()
    
    
    var body: some View {
        List {
            ForEach(fontNames.indices) { i in
                VStack(alignment: .leading) {
                    Text(fontNames[i]).font(.custom(fontNames[i], size: 20))
                    Text(fontNames[i]).font(.caption)
                }
            }
        }
    }
}


struct ListExample: View {
    var body: some View {
        AllFontsListExample()
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
