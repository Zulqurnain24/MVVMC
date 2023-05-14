//
//  User.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

extension User {
    static func mock() -> User {
        User(id: 1, name: "John", username: "john123", email: "john@example.com")
    }
}
