//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
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
        Button("Update") {
          print("UpdateImageView Update")
          document.updateItem(item: item)
          dismiss()
        }
        Spacer()
        Button("Delete") {
          document.deleteItem(id: item.id)
          dismiss();
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
  UpdateImageView(item: ItemModel())
    .environment(Document())
}
