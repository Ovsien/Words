//
//  WordProvider.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol WordProviding {
    func loadWords() -> [String]?
}

final class WordProvider: WordProviding {
    func loadWords() -> [String]? {
        guard let url = Bundle.main.url(forResource: "words", withExtension: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let words = try JSONDecoder().decode([String].self, from: data)
            return words
        } catch {
            print("Error during JSON decoding:", error)
            return nil
        }
    }
}
