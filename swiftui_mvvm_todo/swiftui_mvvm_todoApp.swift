//
//  swiftui_mvvm_todoApp.swift
//  swiftui_mvvm_todo
//
//  Created by Eren Demir on 13.06.2022.
//

import SwiftUI

/*
 MVVM Architecture
 View - UI
 ViewModel - Manages Model for View
 Model - Data
 */

@main
struct swiftui_mvvm_todoApp: App {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(viewModel)
        }
    }
}
