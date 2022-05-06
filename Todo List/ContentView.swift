//
//  ContentView.swift
//  Todo List
//
//  Created by zhaoxin on 2022/5/7.
//

import SwiftUI

struct ContentView: View {
    @State private var items = [Item]()
    @State private var addNewItem = false
    
    let addNewItemPublisher = NotificationCenter.default.publisher(for: AddItemView.addNewItem)
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                if items.isEmpty {
                    Text("No Data")
                } else {
                    List($items) { item in
                        HStack {
                            Text(DateFormatter.localizedString(from: item.startDate.wrappedValue, dateStyle: .none, timeStyle: .short))
                            Text(item.title.wrappedValue)
                        }
                    }
                    .frame(minWidth: 580, minHeight: 400, idealHeight: 600)
                }
            }
            .onReceive(addNewItemPublisher) { notification in
                if let userInfo = notification.userInfo as? [String:Item], let item = userInfo["new item"] {
                    items.append(item)
                    print(items)
                }
            }
            
            Button {
                add()
            } label: {
                Text("Add")
            }
            .sheet(isPresented: $addNewItem) {
                AddItemView()
            }
        }
        .padding()
        .frame(width: 600, height: 600, alignment: .center)
        
    }
    
    private func add() {
        addNewItem = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
