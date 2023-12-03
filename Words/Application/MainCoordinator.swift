//
//  MainCoordinator.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

protocol RootCoordinatorOutput: Coordinator { 
    func transitionToBack()
    func transitionToNewGame()
    func transitionToContinueGame()
}

final class RootCoordinator: RootCoordinatorOutput {

    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = StartModuleFactory().make(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    // MARK: - Game
    func transitionToBack() {
        navigationController.popViewController(animated: true)
    }

    func transitionToNewGame() {
        let viewController = GameModuleFactory().make(coordinator: self) as! GameViewController
        viewController.viewModel.startNewGame()
        navigationController.pushViewController(viewController, animated: true)
    }

    func transitionToContinueGame() {
        let viewController = GameModuleFactory().make(coordinator: self) as! GameViewController
        viewController.viewModel.loadGame()
        navigationController.pushViewController(viewController, animated: true)
    }

}
