//
//  CoreDataManager+User.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation
import CoreData

extension CoreDataManager {
    func saveUsers(_ users: [User]) {
        users.forEach { user in
            let cdUser = CDUser(context: context)
            cdUser.id = Int64(user.id)
            cdUser.name = user.name
            cdUser.username = user.username
            cdUser.email = user.email
        }
        saveContext()
    }

    func fetchUsers() -> [CDUser] {
        let request: NSFetchRequest<CDUser> = CDUser.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("\u{274c} Failed to fetch users: \(error)")
            return []
        }
    }
}
