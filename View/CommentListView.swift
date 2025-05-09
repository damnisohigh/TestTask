//
//  CommentListView.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import SwiftUI

struct CommentListView: View {
    let postId: Int
    @StateObject private var viewModel = CommentViewModel()

    var body: some View {
        List {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                ForEach(viewModel.comments) { comment in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(comment.name)
                            .font(.headline)
                        Text(comment.body)
                            .font(.body)
                        Text(comment.email)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Comments")
        .onAppear {
            viewModel.loadComments(for: postId)
        }
    }
}
