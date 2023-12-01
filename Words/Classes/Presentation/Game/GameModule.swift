//
//  GameModule.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol GameModuleDependencies: AnyObject {
    var wordProvider: WordProviding { get }
    var userDefaultsManager: UserDefaultsManaging { get }
}

final class GameModule {
    static let shared = GameModule()

    private init() { }

    var dependencies: GameModuleDependencies?
}
