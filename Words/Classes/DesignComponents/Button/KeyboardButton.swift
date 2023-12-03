//
//  KeyboardKeyButton.swift
//  Words
//
//  Created by Alexandr Ovsienko on 03.12.2023.
//

import UIKit

final class KeyboardButton: UIButton {
    init(key: String, target: Any?, action: Selector) {
        super.init(frame: .zero)
        self.setTitle(key, for: .normal)
        self.setTitleColor(UIColor(resource: .keyboardButton), for: .normal)
        self.setTitleColor(.gray, for: .highlighted)
        self.titleLabel?.font = UIFont(
            name: Fonts.inter_medium,
            size: FontSize.px16
        )
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
        self.layer.borderColor = UIColor.white.cgColor
        self.addTarget(target, action: action, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
