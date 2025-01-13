//
//  MeaningResponse.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import Foundation

struct MeaningResponse: Decodable {
    let partOfSpeech: String
    let definitions: [DefinitionResponse]
}
