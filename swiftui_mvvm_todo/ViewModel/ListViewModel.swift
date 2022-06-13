//
//  ListViewModel.swift
//  swiftui_mvvm_todo
//
//  Created by Eren Demir on 13.06.2022.
//

import Foundation

class ListViewModel:ObservableObject {
    
    @Published var items : [ItemModel] = [] {
        didSet{
            saveItem()
        }
    }
    let itemsKey:String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = decodedData
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        
    }
    func moveItem(indexSet: IndexSet,newOffset: Int){
        items.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    func addItem(item:ItemModel){
        items.append(item)
    }
    
    func updateItem(item:ItemModel){
        //        if let index = items.firstIndex { existingItem in
        //            return existingItem.id == item.id
        //        }{
        //
        //        }
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData,forKey: itemsKey)
        }
    }
}
