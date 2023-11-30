//
//  StartViewModel.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import Foundation

protocol StartViewModeling {
    func isGameInProgress() -> Bool
}

final class StartViewModel: StartViewModeling {
    weak var coordinator: Coordinator!
    private weak var userDefaultsManager: (any UserDefaultsManaging)!

    init(
        coordinator: Coordinator,
        userDefaultsManager: any UserDefaultsManaging
    ) {
        self.coordinator = coordinator
        self.userDefaultsManager = userDefaultsManager
    }

    func isGameInProgress() -> Bool {
        return userDefaultsManager.isGameSaved()
    }
}
