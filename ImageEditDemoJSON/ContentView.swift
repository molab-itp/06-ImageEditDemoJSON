//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
  @Environment(Document.self) var document
    
    var body: some View {
        NavigationView {
            List {
                // Display in reverse order to see new additions first
                ForEach(document.model.items.reversed()) { item in
                    NavigationLink( destination:
                        UpdateImageView(item: item)
                    )
                    {
                        ItemRow(item: item)
                    }
                }
            }
            .navigationTitle("My Images")
            .navigationBarItems(
                trailing:
                    NavigationLink( destination:
                        AddImageView(item: ItemModel())
                    )
                {
                    Text("Add Image")
                }
            )
        }
    }
}

#Preview {
  ContentView()
    .environment(Document())
}
