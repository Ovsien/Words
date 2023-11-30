//
//  AppDelegate.swift
//  Words
//
//  Created by Alexandr Ovsienko on 28.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// DI-container for managers
    private(set) lazy var managerDependencies: ManagerDependenciesProtocol = {
        ManagerDependencies()
    }()

    /// DI-container for provider
    private (set) lazy var providerDependencies: ProviresDependenciesProtocol = {
        ProviresDependencies()
    }()

    /// Dependency adapter
    private lazy var moduleDependenciesAdapter: ModuleDependenciesAdapterProtocol = {
        ModuleDependenciesAdapter(
            managerDependencies: managerDependencies,
            providerDependencies: providerDependencies
        )
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        moduleDependenciesAdapter.adapt()

        return true
    }
}

