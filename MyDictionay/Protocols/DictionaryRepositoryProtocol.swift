//
//  DictionaryRepositoryProtocol.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

protocol DictionaryRepositoryProtocol {
    func fetchWordMeaning(for word: String) async throws -> [WordMeaning]
}
