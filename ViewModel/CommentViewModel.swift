//
//  CommentViewModel.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    func loadComments(for postId: Int) {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchComments(for: postId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let comments):
                    self?.comments = comments
                    CoreDataManager.shared.saveComments(comments) 
                case .failure:
                    self?.comments = CoreDataManager.shared.fetchComments(for: postId).map {
                        Comment(id: Int($0.id), postId: Int($0.postId), name: $0.name ?? "", email: $0.email ?? "", body: $0.body ?? "")
                    }
                }
            }
        }
    }
}
