//
//  FetchWordMeaningUseCaseProtocol.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

protocol FetchWordMeaningUseCaseProtocol {
    func execute(for word: String) async throws -> [WordMeaning]
}
