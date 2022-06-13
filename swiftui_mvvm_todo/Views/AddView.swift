//
//  AddView.swift
//  swiftui_mvvm_todo
//
//  Created by Eren Demir on 13.06.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Your todo...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(
                    action:saveButtonPressed,
                    label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height:55)
                            .frame(maxWidth:.infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                
            }
            .padding(14)
        }
        .navigationTitle("Add Item")
        .alert(isPresented: $showAlert,content: getAlert)
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            viewModel.addItem(item: ItemModel(title: textFieldText, isDone: false))
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
