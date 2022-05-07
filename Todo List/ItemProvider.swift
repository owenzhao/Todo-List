//
//  ItemProvider.swift
//  Todo List
//
//  Created by zhaoxin on 2022/5/7.
//

import Foundation
import CoreData
import AppKit

class ItemProvider:ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                let alert = NSAlert(error: error)
                NSSound.beep()
                alert.runModal()
            }
        }
    }
}
