//
//  StartViewModel.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import Foundation

final class StartViewModel {
    func isGameInProgress() -> Bool {
        return UserDefaults.standard.object(forKey: "CurrentGame") != nil
    }
}
