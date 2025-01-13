//
//  DefinitionResponse.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

struct DefinitionResponse: Decodable {
    let definition: String
    let example: String?
    let synonyms: [String]?
    let antonyms: [String]?
}
