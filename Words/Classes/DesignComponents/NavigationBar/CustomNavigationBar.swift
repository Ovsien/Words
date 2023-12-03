//
//  CustomNavigationBar.swift
//  Words
//
//  Created by Alexandr Ovsienko on 03.12.2023.
//

import UIKit

final class CustomNavigationBar: UINavigationBar {
    private weak var target: AnyObject!
    private var action: Selector!
    private var title: String!
    
    convenience init(title: String, target: AnyObject, action: Selector) {
        self.init()
        self.title = title
        self.target = target
        self.action = action
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        setBackgroundImage(UIImage(), for: .default)
        backgroundColor = UIColor(resource: .primaryBackground)
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(resource: .barTint)]
        
        let backButton = UIBarButtonItem(
            image: UIImage(resource: .backButton),
            style: .plain,
            target: target,
            action: action
        )
        let navigationItem = UINavigationItem(title: title)
        navigationItem.leftBarButtonItem = backButton
        self.setItems([navigationItem], animated: false)
    }
}
