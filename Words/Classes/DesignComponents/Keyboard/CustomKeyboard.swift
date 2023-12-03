//
//  CustomKeyboard.swift
//  Words
//
//  Created by Alexandr Ovsienko on 03.12.2023.
//

import UIKit

final class CustomKeyboard: UIView {

    private let keys: [[String]] = [
        ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ъ"],
        ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"],
        ["я", "ч", "с", "м", "и", "т", "ь", "б", "ю"]
    ]
    
    private let keyHeight: CGFloat = 40
    private let spacing: CGFloat = 5
    private let padding: CGFloat = 16
    private let minButtonWidth: CGFloat = 24

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupKeyboard()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupKeyboard()
    }

    private func setupKeyboard() {
        backgroundColor = .black
        let buttonWidth = calculateButtonWidth()

        let stackView = createStackView()
        for (index, row) in keys.enumerated() {
            let rowStackView = createRowStackView(for: index)
            setupButtons(in: rowStackView, for: row, with: buttonWidth, at: index)
            stackView.addArrangedSubview(rowStackView)
        }

        addSubview(stackView)
        setupStackViewConstraints(stackView)
    }

    private func calculateButtonWidth() -> CGFloat {
        let maxButtonCount = keys.map { $0.count }.max() ?? 0
        let totalSpacing = CGFloat(maxButtonCount - 1) * spacing
        let totalPadding = CGFloat(2) * padding
        let screenWidth = UIScreen.main.bounds.width
        var buttonWidth = (screenWidth - totalSpacing - totalPadding) / CGFloat(maxButtonCount)
        buttonWidth = max(buttonWidth, minButtonWidth)
        return buttonWidth
    }

    private func createStackView() -> UIStackView {
        return StackView(
            alignment: .center,
            axis: .vertical,
            spacing: spacing,
            distribution: .fillProportionally
        )
    }

    private func createRowStackView(for index: Int) -> UIStackView {
        let rowStackView = StackView(
            spacing: Spacing.px5,
            distribution: .fillEqually
        )
        if index == keys.count - 1 {
            rowStackView.alignment = .center
            rowStackView.distribution = .equalSpacing
        } else {
            rowStackView.alignment = .center
            rowStackView.distribution = .fillEqually
        }
        return rowStackView
    }

    private func setupButtons(in rowStackView: UIStackView, for row: [String], with buttonWidth: CGFloat, at index: Int) {
        if index == keys.count - 1 {
            let leftButton = ActionKeyboardButton(
                image: UIImage(resource: .checkUnactive),
                target: self,
                action: #selector(checkButtonTapped)
            )
            rowStackView.addArrangedSubview(leftButton)
        }

        for key in row {
            let button = KeyboardButton(
                key: key,
                target: self,
                action: #selector(keyTapped(_:))
            )
            rowStackView.addArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.width.equalTo(buttonWidth)
                make.height.equalTo(keyHeight)
            }
        }

        if index == keys.count - 1 {
            let rightButton = ActionKeyboardButton(
                image: UIImage(resource: .deleteUnactive),
                target: self,
                action: #selector(deleteeButtonTapped)
            )
            rowStackView.addArrangedSubview(rightButton)
        }
    }

    private func setupStackViewConstraints(_ stackView: UIStackView) {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.top.equalToSuperview()
        }
    }
    
    @objc private func keyTapped(_ sender: UIButton) {
        // Handle key tap event
    }
    
    @objc private func checkButtonTapped() {
        // Handle left button tap event
    }
    
    @objc private func deleteeButtonTapped() {
        // Handle right button tap event
    }
}
