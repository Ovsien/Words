//
//  StartViewModel.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import Foundation

protocol StartViewModeling {
    func isGameInProgress() -> Bool
    func transitionToNewGame()
    func transitionToContinueGame()
}

final class StartViewModel: StartViewModeling {
    private weak var coordinator: RootCoordinatorOutput!
    private weak var userDefaultsManager: UserDefaultsManaging!

    init(
        coordinator: RootCoordinatorOutput,
        userDefaultsManager: UserDefaultsManaging
    ) {
        self.coordinator = coordinator
        self.userDefaultsManager = userDefaultsManager
    }

    func isGameInProgress() -> Bool {
        return userDefaultsManager.isGameSaved()
    }

    func transitionToNewGame() {
        coordinator.transitionToNewGame()
    }

    func transitionToContinueGame() {
        coordinator.transitionToContinueGame()
    }
}
