//
//  GameBoard.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit
import SnapKit
import Combine

final class GameBoard: UIView {
    private var textFields: [[TextField]] = []
    private var subscriptions = Set<AnyCancellable>()
    private weak var viewModel: GameViewModeling!

    private lazy var mainStack: StackView = {
        StackView(
            axis: .vertical,
            spacing: Spacing.px6,
            distribution: .fillEqually
        )
    }()

    init(viewModel: GameViewModeling) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupTextFields()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextFields() {
        let numberOfRows = 5
        let numberOfColumns = 6

        addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        (0..<numberOfColumns).forEach { _ in
            let rowFields = createRow(numberOfRows: numberOfRows)
            textFields.append(rowFields)
        }
    }

    private func createRow(numberOfRows: Int) -> [TextField] {
        let rowStack = StackView(
            axis: .horizontal,
            spacing: Spacing.px6,
            distribution: .fillEqually
        )

        mainStack.addArrangedSubview(rowStack)

        var rowFields: [TextField] = []
        for column in 0..<numberOfRows {
            let textField = createTextField(tag: column)
            rowStack.addArrangedSubview(textField)
            rowFields.append(textField)
        }
        return rowFields
    }

    private func createTextField(tag: Int) -> TextField {
        let rowHeight: CGFloat = 40
        let numberOfRows: CGFloat = 3
        let spacing: CGFloat = 5
        let safeAreaInset: CGFloat = 46
        let keyboardHeight = numberOfRows * rowHeight + (numberOfRows - 1) * spacing + safeAreaInset

        let textField = TextField(
            tag: tag,
            delegate: self
        )
        textField.snp.makeConstraints { make in
            make.width.equalTo(textField.snp.height)
        }

        let customKeyboard = CustomKeyboard(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.frame.width,
                height: keyboardHeight
            )
        )
        textField.inputView = customKeyboard

        textField.activeNextField.sink { [weak self] tag in
            self?.activateTextField(at: tag + 1)
        }.store(in: &subscriptions)

        textField.activePreviousField.sink { [weak self] tag in
            self?.activateTextField(at: tag - 1)
        }.store(in: &subscriptions)

        return textField
    }

    private func activateTextField(at tag: Int) {
        let textField = textFields.flatMap { $0 }.first { $0.tag == tag }
        textField?.text = ""
        textField?.becomeFirstResponder()
        shakeTextField(textField)
    }

    private func shakeTextField(_ textField: UITextField?) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.6
        animation.values = [-2.5, 2.5, -2.5, 2.5, -1.0, 1.0, -0.5, 0.5, 0.0 ]
        textField?.layer.add(animation, forKey: "shake")
    }
}

extension GameBoard: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        viewModel.handleInput(updatedText)
        return updatedText.count <= 1
    }
}
