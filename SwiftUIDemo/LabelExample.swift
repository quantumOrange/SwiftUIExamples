//
//  LableExample.swift
//  SwiftUIDemoApp
//
//  Created by David Crooks on 02/03/2021.
//

import SwiftUI

struct MyLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        Label(configuration)
            .border(Color.red)
    }
}


struct LabelExample: View {
    var body: some View {
        Label("Website", systemImage: "globe")
            .labelStyle(MyLabelStyle())
            
        
        
        
        
       
    }
}

struct LableExample_Previews: PreviewProvider {
    static var previews: some View {
        LabelExample()
    }
}
