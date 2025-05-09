//
//  TestTaskApp.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import SwiftUI

@main
struct TestTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PostListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
