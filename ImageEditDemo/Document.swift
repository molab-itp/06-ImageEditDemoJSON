//
//  Model.swift
//

import Foundation

class Document: ObservableObject {
    @Published var model: Model
    // @Published var items:[ItemModel]
    
    // file name to store JSON for model items
    let saveFileName = "model.json"
    
    // true to initialize model items with sample items
    let initSampleItems = true
    
    init() {
        print("Model init")
        // items for testing
        model = Model(JSONfileName: saveFileName);
        // Would be better design practice to move all items operations
        // to Model funcs
        //model.items = [
        //    ItemModel(urlStr: imageArray[9], label:"jht1", assetName: "red", systemName: "rectangle"),
        //    ItemModel(urlStr: imageArray[10], label:"jht2", assetName: "yellow", systemName: "dog"),
        //    ItemModel(urlStr: imageArray[0], label:"dan", systemName: "circle"),
        //]
        if initSampleItems && model.items.isEmpty {
            model.items = []
            addItem(urlStr: imageArray[9], label:"jht1", assetName: "red", systemName: "dog");
            addItem(urlStr: imageArray[10], label:"jht2", assetName: "yellow", systemName: "circle");
            addItem(urlStr: imageArray[0], label:"dan", assetName: "", systemName: "rectangle");
            saveModel();
        }
    }
    
    func addItem(urlStr:String, label:String, assetName:String, systemName: String) {
        // let item = ItemModel(urlStr:urlStr, label:label, assetName: assetName, systemName: systemName)
        // model.items.append(item)
        model.addItem(urlStr:urlStr, label:label, assetName: assetName, systemName: systemName);
        saveModel();
    }
        
    func updateItem(id: UUID, urlStr:String, label:String, assetName:String, systemName: String) {
        model.updateItem(id: id, urlStr:urlStr, label:label, assetName: assetName, systemName: systemName);
        // if let index = findIndex(id) {
        //  model.items[index].id = UUID()
        //  model.items[index].urlStr = urlStr
        //  model.items[index].label = label
        //  model.items[index].assetName = assetName
        //  model.items[index].systemName = systemName
        //  }
        saveModel();
    }
    
    func deleteItem(id: UUID) {
        model.deleteItem(id: id)
        // if let index = findIndex(id) {
        //  model.items.remove(at: index)
        // }
        saveModel();
    }
    
    func saveModel() {
        print("Document saveModel")
        model.saveAsJSON(fileName: saveFileName)
    }
    
    // Not used
    //    func newItem() {
    //        addItem(urlStr: "", label: "", assetName: "", systemName: "")
    //    }
}

// Array of image url strings
let imageArray = [
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/dan-osullivan1.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/alumni/ari_headshot.jpg.preset.square.jpeg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/GabePattern5.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/Sarah-Rothberg.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/clay-shirky.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/GeneralPics/katherinedillon.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/alumni/pedro.galvao.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/Faculty/Luisa-Pereira.jpg.preset.square.jpeg",
    "https://tisch.nyu.edu/content/dam/tisch/itp/alumni/raaziq-brown.jpg.preset.square.jpeg?",
    "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_4491.JPEG",
    "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7555.JPEG",
]
