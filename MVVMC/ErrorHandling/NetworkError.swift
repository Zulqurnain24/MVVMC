//
//  NetworkError.swift
//  MVVMC
//
//  Created by Mohammad Zulqurnain on 14/05/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serverError(statusCode: Int)
    case unknownError
}
