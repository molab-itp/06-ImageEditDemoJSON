//
//  ImageEditDemoApp.swift
//  ImageEditDemo
//
//  Created by jht2 on 2/20/23.
//

import SwiftUI

@main
struct ImageDemoApp: App {
    
    @State var document = Document()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(document)
            
        }
    }
}
//comment
