//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by zhaoxin on 2022/5/7.
//

/*
 <a href="https://www.flaticon.com/free-icons/reminder" title="reminder icons">Reminder icons created by max.icons - Flaticon</a>
 */

import SwiftUI

@main
struct Todo_ListApp: App {
    @StateObject private var itemProvider = ItemProvider()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, itemProvider.container.viewContext)
        }
    }
}
