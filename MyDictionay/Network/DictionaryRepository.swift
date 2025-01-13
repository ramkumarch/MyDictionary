//
//  DictionaryRepository.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

final class DictionaryRepository: DictionaryRepositoryProtocol {
    private let session: URLSession
    private let baseURL: String
    
    init(session: URLSession = .shared, baseURL: String = "https://api.dictionaryapi.dev/api/v2/entries/en/") {
        self.session = session
        self.baseURL = baseURL
    }
    
    func fetchWordMeaning(for word: String) async throws -> [WordMeaning] {
        guard let url = URL(string: baseURL + word) else {
            throw DictionaryRepositoryError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            // Check for HTTP response status
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw DictionaryRepositoryError.networkError(NSError(domain: "InvalidResponse", code: 0, userInfo: nil))
            }
            
            // Decode the response
            let responseData = try JSONDecoder().decode([DictionaryResponse].self, from: data)
            return responseData.map {
                WordMeaning(
                    word: $0.word,
                    phonetics: $0.phonetics,
                    origin: $0.origin ?? "No origin available",
                    meanings: $0.meanings
                )
            }
        } catch let decodingError as DecodingError {
            throw DictionaryRepositoryError.decodingFailed
        } catch {
            throw DictionaryRepositoryError.networkError(error)
        }
    }
}
