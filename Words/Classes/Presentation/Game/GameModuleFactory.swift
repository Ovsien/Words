//
//  GameModuleFactory.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit

final class GameModuleFactory {
    func make(coordinator: RootCoordinatorOutput) -> UIViewController {
        guard let dependencies = GameModule.shared.dependencies else {
            fatalError("dependencies required")
        }

        // View Model
        let viewModel = GameViewModel(
            coordinator: coordinator,
            wordProvider: dependencies.wordProvider,
            userDefaultsManager: dependencies.userDefaultsManager
        )

        // View Controller
        let viewController = GameViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
