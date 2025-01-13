//
//  FetchWordMeaningUseCase.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation


final class FetchWordMeaningUseCase: FetchWordMeaningUseCaseProtocol {
    private let repository: DictionaryRepositoryProtocol

    init(repository: DictionaryRepositoryProtocol) {
        self.repository = repository
    }

    func execute(for word: String) async throws -> [WordMeaning] {
        return try await repository.fetchWordMeaning(for: word)
    }
}
