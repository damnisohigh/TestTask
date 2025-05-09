//
//  PostListView.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var postViewModel = PostViewModel()
    @StateObject private var userViewModel = UserViewModel()

    @State private var isUserListPresented = false

    var selectedUserName: String {
        userViewModel.users.first(where: { $0.id == postViewModel.userId })?.name ?? "User \(postViewModel.userId)"
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Current User: \(selectedUserName)")
                    .font(.headline)
                    .padding(.top)

                if postViewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if let error = postViewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(postViewModel.posts) { post in
                        NavigationLink(destination: CommentListView(postId: post.id)) {
                            VStack(alignment: .leading) {
                                Text(post.title.capitalized)
                                    .font(.headline)
                                Text(post.body)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isUserListPresented = true
                    }) {
                        Image(systemName: "person.circle")
                    }
                }
            }
            .sheet(isPresented: $isUserListPresented) {
                UserListView(userViewModel: userViewModel, selectedUserId: $postViewModel.userId)
            }
            .onAppear {
                userViewModel.loadUsers()
                postViewModel.loadPosts(for: postViewModel.userId)
            }
        }
    }
}
