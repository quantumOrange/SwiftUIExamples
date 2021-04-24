//
//  SwiftUIDemoAppApp.swift
//  SwiftUIDemoApp
//
//  Created by David Crooks on 02/03/2021.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    init() {
       
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
