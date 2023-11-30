//
//  ProviresDependenciesProtocol.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import Foundation

protocol ProviresDependenciesProtocol {
    var wordprovider: WordProviding { get }
}

final class ProviresDependencies: ProviresDependenciesProtocol {
    var wordprovider: WordProviding = {
        return WordProvider()
    }()
}


