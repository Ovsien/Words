//
//  StartModule.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol StartModuleDependencies: AnyObject {
    var userDefaultsManager: UserDefaultsManaging { get }
}

final class StartModule {
    static let shared = StartModule()

    private init() { }

    var dependencies: StartModuleDependencies?
}
