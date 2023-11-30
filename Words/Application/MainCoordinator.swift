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

protocol RootCoordinatorOutput: Coordinator { }

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
}
