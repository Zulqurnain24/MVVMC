//
//  class UserService.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Combine
import Foundation

protocol UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], Error>
}

class UserService: UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        guard let url = URL(string: "\(APIEnvironment.development)\(APIEndpoint.users)") else { return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher() }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
