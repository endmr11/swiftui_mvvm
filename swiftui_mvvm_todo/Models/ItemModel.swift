//
//  ItemModel.swift
//  swiftui_mvvm_todo
//
//  Created by Eren Demir on 13.06.2022.
//

import Foundation


struct ItemModel:Identifiable,Codable {
    var id: String
    let title: String
    let isDone: Bool
    
    init(id:String = UUID().uuidString, title:String,isDone:Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    func updateCompletion()-> ItemModel {
        return ItemModel(id: id, title: title, isDone: !isDone)
    }
}
