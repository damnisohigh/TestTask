//
//  PostViewModel.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    var userId: Int = 1 {
        didSet {
            loadPosts(for: userId)
        }
    }

    func loadPosts(for userId: Int) {
        isLoading = true
        errorMessage = nil

        NetworkManager.shared.fetchPosts(for: userId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let posts):
                    self?.posts = posts
                    CoreDataManager.shared.savePosts(posts)
                case .failure:
                    self?.posts = CoreDataManager.shared.fetchPosts(for: userId).map {
                        Post(id: Int($0.id), userId: Int($0.userId), title: $0.title ?? "", body: $0.body ?? "")
                    }
                }
            }
        }
    }
}
