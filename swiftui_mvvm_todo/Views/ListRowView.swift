//
//  ListRowView.swift
//  swiftui_mvvm_todo
//
//  Created by Eren Demir on 13.06.2022.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(item.isDone ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First item", isDone: true)
    static var item2 = ItemModel(title: "Second item", isDone: false)
    static var previews: some View {
        Group{
            ListRowView(item: item1 )
            ListRowView(item: item2 )
        }
        .previewLayout(.sizeThatFits)
    }
}
