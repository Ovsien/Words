//
//  ViewConfigurable.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import Foundation

protocol ViewConfigurable {
    func setupUI()
    func setupLayout()
    func updateUI()
    func setupBehaviour()
    func configureViewController()
}

extension ViewConfigurable {
    func configureViewController() {
        setupLayout()
        setupUI()
        updateUI()
        setupBehaviour()
    }
}

