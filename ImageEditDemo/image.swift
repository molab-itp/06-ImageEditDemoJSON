//
//  image.swift
//

import SwiftUI

// Read in an image from the array of url strings
func imageFor( index: Int) async -> UIImage  {
    let urlStr = imageArray[index % imageArray.count]
    return await imageFor(string: urlStr)
}

// Read in an image from a url string
func imageFor(string str: String) async -> UIImage!  {
    guard let url = URL(string: str) else {
        print("imageFor no url for str", str);
        return nil
    }
    guard let imgData = try? Data(contentsOf: url) else {
        print("imageFor no imgData for str", str);
        return nil
    }
    guard let uiImage = UIImage(data:imgData) else {
        print("imageFor no uiImage for str", str);
        return nil
    }
    return uiImage
}

