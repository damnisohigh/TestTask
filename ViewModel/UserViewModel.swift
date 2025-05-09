//
//  UserViewModel.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    func loadUsers() {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let users):
                    self?.users = users
                    CoreDataManager.shared.saveUsers(users)
                case .failure:
                    self?.users = CoreDataManager.shared.fetchUsers().map {
                        User(id: Int($0.id), name: $0.name ?? "", username: $0.username ?? "", email: $0.email ?? "")
                    }
                }
            }
        }
    }
}
