//
//  NetworkManager.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        fetch(urlString: "https://jsonplaceholder.typicode.com/users", completion: completion)
    }

    func fetchPosts(for userId: Int, completion: @escaping (Result<[Post], Error>) -> Void) {
        fetch(urlString: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)", completion: completion)
    }

    func fetchComments(for postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        fetch(urlString: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)", completion: completion)
    }

    private func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(NetworkError.invalidURL))
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                return completion(.failure(error))
            }

            guard let data = data else {
                return completion(.failure(NetworkError.noData))
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
