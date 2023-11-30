//
//  Game.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

struct Game: Codable {
    var currentWord: String
    var guessedLetters: [String]
    var attempts: Int
    var isFinished: Bool
}
