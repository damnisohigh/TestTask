//
//  CoreDataManager.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "TestTask")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("\u{274c} Failed to load Core Data store: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        container.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("\u{274c} Failed to save context: \(error)")
            }
        }
    }
}
