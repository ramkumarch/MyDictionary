//
//  DictionaryViewModel.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

@MainActor
final class DictionaryViewModel: ObservableObject {
    @Published var wordMeanings: [WordMeaning] = []
    @Published var error: IdentifiableError? // Change from String? to IdentifiableError?

    private let fetchWordMeaningUseCase: FetchWordMeaningUseCaseProtocol

    init(fetchWordMeaningUseCase: FetchWordMeaningUseCaseProtocol) {
        self.fetchWordMeaningUseCase = fetchWordMeaningUseCase
    }

    func fetchWordMeaning(for word: String) async {
        do {
            let meanings = try await fetchWordMeaningUseCase.execute(for: word)
            wordMeanings = meanings
        } catch let error {
            debugPrint(error)
            self.error = IdentifiableError(message: "Failed to fetch word meaning: \(error.localizedDescription)")
        }
    }
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    var message: String
}
