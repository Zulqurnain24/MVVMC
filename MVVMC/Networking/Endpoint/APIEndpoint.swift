//
//  APIEndpoint.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Foundation

enum APIEndpoint {
    case users
    
    var path: String {
        switch self {
        case .users:
            return "/users"
        }
    }
    
    var url: URL? {
        guard let url = URL(string: APIEnvironment.development.baseURL + path) else { return nil }
        return url
    }
}
