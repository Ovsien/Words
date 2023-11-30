//
//  StartModuleFactory.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit

final class StartModuleFactory {
    func make(coordinator: RootCoordinatorOutput) -> UIViewController {
        guard let dependencies = StartModule.shared.dependencies else {
            fatalError("dependencies required")
        }

        // View Model
        let viewModel = StartViewModel(
            coordinator: coordinator,
            userDefaultsManager: dependencies.userDefaultsManager
        )

        // View Controller
        let viewController = StartViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
