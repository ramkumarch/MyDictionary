//
//  Meaning.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

struct Meaning: Codable, Hashable {
    let partOfSpeech: String
    let definitions: [Definition]
}
