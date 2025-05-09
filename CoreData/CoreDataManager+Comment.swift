//
//  CoreDataManager+Comment.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation
import CoreData

extension CoreDataManager {
    func saveComments(_ comments: [Comment]) {
        comments.forEach { comment in
            let cdComment = CDComment(context: context)
            cdComment.id = Int64(comment.id)
            cdComment.postId = Int64(comment.postId)
            cdComment.name = comment.name
            cdComment.email = comment.email
            cdComment.body = comment.body
        }
        saveContext()
    }

    func fetchComments(for postId: Int) -> [CDComment] {
        let request: NSFetchRequest<CDComment> = CDComment.fetchRequest()
        request.predicate = NSPredicate(format: "postId == %d", postId)
        do {
            return try context.fetch(request)
        } catch {
            print("\u{274c} Failed to fetch comments: \(error)")
            return []
        }
    }
}
