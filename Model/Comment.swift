//
//  Comment.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
}
