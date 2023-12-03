//
//  ActionKeyboardButton.swift
//  Words
//
//  Created by Alexandr Ovsienko on 03.12.2023.
//

import UIKit

final class ActionKeyboardButton: UIButton {
    init(image: UIImage?, target: Any?, action: Selector) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
