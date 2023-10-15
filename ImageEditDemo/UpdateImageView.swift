//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
    var action: String // "Update" or "Add"
    @State var item: ItemModel
    
    @State var uiImage:UIImage?
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var document:Document
    
    var body: some View {
        VStack {
            ZStack {
                Image(item.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Image(systemName: item.systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
        .task {
            uiImage =  await imageFor(string: item.urlStr)
        }
    }
}

struct UpdateImageView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateImageView(action: "action", item: ItemModel())
    }
}
