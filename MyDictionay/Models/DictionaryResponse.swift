//
//  DictionaryResponse.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

struct DictionaryResponse: Codable {
    let word: String
    let phonetics: [Phonetic]
    let origin: String?
    let meanings: [Meaning]
}
