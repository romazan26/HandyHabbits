//
//  CoreDataManager.swift
//  HandyHabbits
//
//  Created by Роман on 28.05.2024.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "MyHabbits")
        container.loadPersistentStores { descption, error in
            if let error = error{
                print("Error looading core data\(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        }catch let error {
            print("Save data erroe \(error.localizedDescription)")
        }
        
    }
}
