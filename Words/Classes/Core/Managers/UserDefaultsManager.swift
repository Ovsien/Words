//
//  UserDefaultsManager.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol UserDefaultsManaging: AnyObject {
    func isGameSaved() -> Bool
    func saveGame(_ game: Game)
    func loadGame() -> Game?
}

final class UserDefaultsManager: UserDefaultsManaging {
    private let defaults = UserDefaults.standard

    func isGameSaved() -> Bool {
        return defaults.object(forKey: "CurrentGame") != nil
    }

    func saveGame(_ game: Game) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(game) {
            defaults.set(encoded, forKey: "CurrentGame")
        }
    }

    func loadGame() -> Game? {
        if let savedGame = defaults.object(forKey: "CurrentGame") as? Data {
            let decoder = JSONDecoder()
            if let loadedGame = try? decoder.decode(Game.self, from: savedGame) {
                return loadedGame
            }
        }
        return nil
    }
}
