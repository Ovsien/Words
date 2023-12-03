//
//  GameViewModel.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol GameViewModeling: AnyObject {
    func backButtonTapped()
    func startNewGame()
    func loadGame()
    func handleInput(_ input: [String])
}

final class GameViewModel: GameViewModeling {
    private var game: Game?

    private weak var coordinator: RootCoordinatorOutput!
    private weak var wordProvider: WordProviding!
    private weak var userDefaultsManager: UserDefaultsManaging!

    init(
        coordinator: RootCoordinatorOutput!,
        wordProvider: WordProviding!,
        userDefaultsManager: UserDefaultsManaging!
    ) {
        self.coordinator = coordinator
        self.wordProvider = wordProvider
        self.userDefaultsManager = userDefaultsManager
    }

    func backButtonTapped() {
        coordinator.transitionToBack()
    }

        func startNewGame() {
            guard let words = wordProvider.loadWords(), let word = words.randomElement() else {
                print("Error: could not load words or words array is empty")
                return
            }

            game = Game(currentWord: word, guessedLetters: [], attempts: 0, isFinished: false)
            if let game {
                userDefaultsManager.saveGame(game)
            }
        }

    func loadGame() {
        game = userDefaultsManager.loadGame()
    }

    func handleInput(_ input: [String]) {
        
    }
}
