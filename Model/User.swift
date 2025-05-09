//
//  User.swift
//  TestTask
//
//  Created by DAMNISOHIGH on 08.05.2025.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
