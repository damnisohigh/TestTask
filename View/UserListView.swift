//
//  UserListView.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var userViewModel: UserViewModel
    @Binding var selectedUserId: Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                if userViewModel.isLoading {
                    ProgressView()
                } else if let error = userViewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    ForEach(userViewModel.users) { user in
                        Button {
                            selectedUserId = user.id
                            dismiss()
                        } label: {
                            HStack {
                                Text(user.name)
                                if selectedUserId == user.id {
                                    Spacer()
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Select User")
            .onAppear {
                userViewModel.loadUsers()
            }
        }
    }
}
