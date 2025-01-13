//
//  DictionaryView.swift
//  MyDictionay
//
//  Created by Ramkumar Chintala on 12/01/25.
//

import SwiftUI
import AVFoundation

struct DictionaryView: View {
    @StateObject private var viewModel: DictionaryViewModel
    @State private var inputText = ""

    init(viewModel: DictionaryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            TextField("Enter a word...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                Task {
                    if !inputText.isEmpty {
                        await viewModel.fetchWordMeaning(for: inputText)
                        inputText = "" // Clear the text after successful fetch
                    }
                }
            }) {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
            }
            List(viewModel.wordMeanings) { meaning in
                VStack(alignment: .leading, spacing: 10) {
                    Text("**Word:** \(meaning.word)").font(.headline)

                    // Display phonetics audio button
                    if let audioLink = meaning.phonetics.compactMap({ $0.audio }).first {
                        Button(action: {
                            playAudio(url: audioLink)
                        }) {
                            HStack {
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.blue)
                                Text("Play Pronunciation").foregroundColor(.blue)
                            }
                        }
                    } else {
                        Text("No audio available").italic()
                    }

                    // Display meanings
                    ForEach(meaning.meanings, id: \.self) { definition in
                        VStack(alignment: .leading, spacing: 5) {
                            Text("**Part of Speech:** \(definition.partOfSpeech)").font(.subheadline)
                            ForEach(definition.definitions, id: \.self) { def in
                                VStack(alignment: .leading) {
                                    Text("Definition: \(def.definition)")
                                        .font(.body)
                                    if let example = def.example {
                                        Text("Example: \(example)")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .padding(.vertical, 10)
            }

        }
        .padding()
        .alert(item: $viewModel.error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func playAudio(url: String) {
        guard let audioURL = URL(string: url) else { return }
        let player = AVPlayer(url: audioURL)
        player.play()
    }
}


