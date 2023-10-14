//
//  Model.swift
//  ImageEditDemo
//
//  Created by jht2 on 10/14/23.
//

import SwiftUI

struct Model: Encodable, Decodable {
    var items: [ItemModel]
    
    init () {
        items = [];
    }
    
    mutating func addItem(urlStr:String, label:String, assetName:String, systemName: String) {
        let item = ItemModel(urlStr:urlStr, label:label, assetName: assetName, systemName: systemName)
        items.append(item)
    }
    
    mutating func updateItem(id: UUID, urlStr:String, label:String, assetName:String, systemName: String) {
        if let index = findIndex(id) {
            let item = ItemModel(urlStr:urlStr, label:label, assetName: assetName, systemName: systemName)
            items[index] = item;
            items[index].id = UUID()
        }
    }
    
    mutating func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
    
}

