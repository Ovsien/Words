//
//  ModuleDependencies.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol ModuleDependenciesAdapterProtocol {
    // Start
    func adapt()
}

final class ModuleDependenciesAdapter {
    private let managerDependencies: ManagerDependenciesProtocol
    private let providerDependencies: ProviresDependenciesProtocol

    init(
        managerDependencies: ManagerDependenciesProtocol,
        providerDependencies: ProviresDependenciesProtocol
    ) {
        self.managerDependencies = managerDependencies
        self.providerDependencies = providerDependencies
    }
}

extension ModuleDependenciesAdapter: ModuleDependenciesAdapterProtocol {
    func adapt() {
        StartModule.shared.dependencies = self
    }
}

// MARK: - Managers
extension ModuleDependenciesAdapter {
    var userDefaultsManager: UserDefaultsManaging {
        managerDependencies.userDefaultsManager
    }
}

// MARK: - Providers
extension ModuleDependenciesAdapter {
    var wordProvider: WordProviding {
        providerDependencies.wordprovider
    }
}

extension ModuleDependenciesAdapter:
    StartModuleDependencies {}
