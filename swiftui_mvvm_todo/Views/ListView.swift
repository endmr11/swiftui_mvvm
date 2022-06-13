//
//  ContentView.swift
//  swiftui_mvvm_todo
//
//  Created by Eren Demir on 13.06.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    var body: some View {
        ZStack{
            if viewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(viewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    viewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add",destination: {
                AddView()
            })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

