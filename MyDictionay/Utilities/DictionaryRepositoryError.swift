//
//  DictionaryRepositoryError.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 13/01/25.
//

import Foundation

// Custom error type 
enum DictionaryRepositoryError: Error, LocalizedError {
    case invalidURL
    case decodingFailed
    case networkError(Error)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .decodingFailed:
            return "Failed to decode the response."
        case .networkError(let error):
            return "Network error occurred: \(error.localizedDescription)"
        case .noData:
            return "No data was returned from the server."
        }
    }
}
