//
//  Item.swift
//

import Foundation

struct ItemModel : Identifiable, Hashable, Encodable, Decodable {
    var id = UUID()
    var urlStr:String = ""
    var label:String = ""
    var assetName:String = ""
    var systemName:String = ""
}

