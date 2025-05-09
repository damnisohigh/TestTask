//
//  CoreDataManager+Post.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation
import CoreData

extension CoreDataManager {
    func savePosts(_ posts: [Post]) {
        posts.forEach { post in
            let cdPost = CDPost(context: context)
            cdPost.id = Int64(post.id)
            cdPost.userId = Int64(post.userId)
            cdPost.title = post.title
            cdPost.body = post.body
        }
        saveContext()
    }

    func fetchPosts(for userId: Int) -> [CDPost] {
        let request: NSFetchRequest<CDPost> = CDPost.fetchRequest()
        request.predicate = NSPredicate(format: "userId == %d", userId)
        do {
            return try context.fetch(request)
        } catch {
            print("\u{274c} Failed to fetch posts: \(error)")
            return []
        }
    }
}
