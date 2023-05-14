//
//  MockUserService.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Combine
import Foundation

class MockUserService: UserServiceProtocol {
    var users: [User]
    var error: Error?

    init(users: [User] = [], error: Error? = nil) {
        self.users = users
        self.error = error
    }

    func fetchUsers() -> AnyPublisher<[User], Error> {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        } else {
            return Just(users)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
