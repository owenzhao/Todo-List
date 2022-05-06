//
//  AddItemView.swift
//  Todo List
//
//  Created by zhaoxin on 2022/5/7.
//

import SwiftUI

struct AddItemView: View {
    static let addNewItem = Notification.Name("addNewItem")
    
    @Environment(\.dismiss) private var dismiss
    @State private var item = Item(startDate: Date(), title: "")
    
    var body: some View {
        VStack {
            Text("Add New Item")
                .font(.title2)
            
            TextField("What to do?", text: $item.title, prompt: Text("Go shopping."))
            DatePicker("When?", selection: $item.startDate)
            
            HStack {
                Button {
                    save()
                } label: {
                    Text("Save")
                }
                .disabled(item.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

                Spacer()
                
                Button {
                    cancel()
                } label: {
                    Text("Cancel")
                }
            }
        }
        .padding()
    }
    
    private func save() {
        NotificationCenter.default.post(name: AddItemView.addNewItem, object: nil, userInfo: ["new item" : item])
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
