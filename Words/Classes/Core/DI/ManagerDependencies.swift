//
//  ManagerDependenciesProtocol.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol ManagerDependenciesProtocol {
    var userDefaultsManager: UserDefaultsManaging { get }
}

final class ManagerDependencies: ManagerDependenciesProtocol {
    var userDefaultsManager: UserDefaultsManaging = {
        return UserDefaultsManager()
    }()
}
