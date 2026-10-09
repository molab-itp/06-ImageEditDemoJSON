//
//  ItemRow.swift
//

import SwiftUI


struct ItemRow: View {
  var item:ItemModel
  
  var body: some View {
    HStack {
      ZStack {
        if !item.assetName.isEmpty {
          Image(item.assetName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height: 100)
        }
        AsyncImage(url: URL(string: item.urlStr)) { phase in
          if let image = phase.image {
            image // Displays the loaded image.
              .resizable()
              .aspectRatio(contentMode: .fit)
          } else if phase.error != nil {
            Color.red // Indicates an error.
          } else {
            Color.clear // Acts as a placeholder.
          }
        }
        .frame(width:100, height: 100)
        if !item.systemName.isEmpty {
          Image(systemName: item.systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height: 100)
        }
      }
      Text(item.label)
      Spacer()
    }
  }
}


#Preview {
  ItemRow(item: ItemModel(label: "I am not a fish", systemName: "fish"))
    .environment(Document())
}
