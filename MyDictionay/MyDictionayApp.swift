//
//  MyDictionayApp.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import SwiftUI

@main
struct MyDictionayApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = DictionaryRepository()
            let useCase = DefaultFetchWordMeaningUseCase(repository: repository)
            let viewModel = DictionaryViewModel(fetchWordMeaningUseCase: useCase)
            DictionaryView(viewModel: viewModel)
        }
    }
}
