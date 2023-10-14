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
}

