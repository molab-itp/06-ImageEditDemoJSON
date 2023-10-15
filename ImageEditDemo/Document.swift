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
        model = Model(JSONfileName: saveFileName);
        if initSampleItems && model.items.isEmpty {
            // items for testing
            model.items = []
            addItem(urlStr: imageArray[9], label:"jht1", assetName: "red", systemName: "dog");
            addItem(urlStr: imageArray[10], label:"jht2", assetName: "yellow", systemName: "circle");
            addItem(urlStr: imageArray[0], label:"dan", assetName: "", systemName: "rectangle");
            saveModel();
        }
    }
    
    func addItem(urlStr:String, label:String, assetName:String, systemName: String) {
        let item = ItemModel(id: UUID(), urlStr: urlStr, label: label, assetName: assetName, systemName: systemName);
        model.addItem(item: item);
        saveModel();
    }
    
    func addItem(item: ItemModel) {
        model.addItem(item: item);
        saveModel();
    }

    func updateItem(item: ItemModel) {
        model.updateItem(item: item);
        saveModel();
    }
    
    func deleteItem(id: UUID) {
        model.deleteItem(id: id)
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
