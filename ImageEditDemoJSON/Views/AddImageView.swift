//
//  AddImageView.swift
//

import SwiftUI

// AddImageView is very similar to UpdateImageView
// consider refactoring into single View with property vars
// for the differences
//  Button Add/Cancel
//  Button Update/Delete
//
struct AddImageView: View {
  @State var item: ItemModel
  
  @Environment(\.dismiss) var dismiss
  @Environment(Document.self) var document
  
  var body: some View {
    VStack {
      ZStack {
        if !item.assetName.isEmpty {
          Image(item.assetName)
            .resizable()
            .aspectRatio(contentMode: .fit)
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
        if !item.systemName.isEmpty {
          Image(systemName: item.systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
      }
      HStack {
        Button("Add") {
          print("AddImageView Add")
          document.addItem(item: item)
          dismiss()
        }
        Spacer()
        Button("Cancel") {
          print("AddImageView Cancel")
          dismiss()
        }
      }.padding(10)
      Form {
        TextField("url", text: $item.urlStr)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("label", text: $item.label)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("assetName", text: $item.assetName)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
        TextField("systemName", text: $item.systemName)
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
      }
    }
  }
}

#Preview {
  AddImageView(item: ItemModel())
    .environment(Document())
}
