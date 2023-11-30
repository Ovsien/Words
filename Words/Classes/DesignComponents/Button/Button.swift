//
//  Button.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import UIKit

class Button: UIButton {
    init(title: String, action: Selector, target: Any) {
        super.init(frame: .zero)
        configureButton()
        configureTitle(title: title)
        addTarget(
            target,
            action: action,
            for: .touchUpInside
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureButton() {
        layer.backgroundColor = UIColor(resource: .buttonBackground).cgColor
        layer.cornerRadius = CornerRadius.px16
    }

    private func configureTitle(title: String) {
        setTitleColor(
            UIColor(resource: .buttonText),
            for: .normal
        )
        titleLabel?.font = UIFont(
            name: Fonts.inter_medium,
            size: FontSize.px18
        )
        let paragraphStyle = NSMutableParagraphStyle()
        let attributedTitle = NSMutableAttributedString(
            string: title,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
