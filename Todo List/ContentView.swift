//
//  ContentView.swift
//  Todo List
//
//  Created by zhaoxin on 2022/5/7.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.startDate, order: .forward)]) var items:FetchedResults<Item>
    @State private var item:Item?
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                if items.isEmpty {
                    Text("No Data")
                } else {
                    List(items) { item in
                        HStack {
                            Text(DateFormatter.localizedString(from: item.startDate!, dateStyle: .none, timeStyle: .short))
                            Text(item.title!)
                        }
                    }
                    .frame(minWidth: 580, minHeight: 400, idealHeight: 600)
                }
            }
            
            Button {
                add()
            } label: {
                Text("Add")
            }
            .sheet(item: $item) { item in
                AddItemView(item: item)
            }
        }
        .padding()
        .frame(width: 600, height: 600, alignment: .center) 
    }
    
    private func add() {
        let item = Item(context: managedObjectContext)
        item.id = UUID()
        item.startDate = Date()
        self.item = item
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
