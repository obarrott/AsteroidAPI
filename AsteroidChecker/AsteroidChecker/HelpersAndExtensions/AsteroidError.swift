//
//  AsteroidError.swift
//  AsteroidChecker
//
//  Created by Owen Barrott on 9/23/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import Foundation

enum AsteroidError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "the url is invalid"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "no data was returned."
        case .unableToDecode(_):
            return "server was unable to decode the data"
        }
    }
}
