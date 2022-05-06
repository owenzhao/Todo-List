//
//  Model.swift
//  Todo List
//
//  Created by zhaoxin on 2022/5/7.
//

import Foundation

struct Item:Identifiable {
    let id = UUID().uuidString
    var startDate:Date
    var title:String
}

class ItemProvider:ObservableObject {
    @Published var items = [Item]()
}
