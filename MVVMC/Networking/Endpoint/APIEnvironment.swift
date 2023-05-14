//
//  APIEnvironment.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Foundation

enum APIEnvironment {
    case development
    case production
    
    var baseURL: String {
        switch self {
        case .development:
            return "https://jsonplaceholder.typicode.com"
        case .production:
            return "https://api.example.com"
        }
    }
}
