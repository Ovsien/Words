//
//  TextField.swift
//  Words
//
//  Created by Alexandr Ovsienko on 30.11.2023.
//

import UIKit
import Combine

final class TextField: UITextField {

    let activeNextField = PassthroughSubject<Int, Never>()
    let activePreviousField = PassthroughSubject<Int, Never>()

    private struct Constants {
        static let borderWidth: CGFloat = 1
        static let startTag: Int = 0
    }

    convenience init(
        tag: Int = Constants.startTag,
        delegate: UITextFieldDelegate? = nil
    ) {
        self.init(frame: .zero)
        self.tag = tag
        self.delegate = delegate
        textAlignment = .center
        layer.cornerRadius = CornerRadius.px4
        font = UIFont(
            name: Fonts.inter_medium,
            size: FontSize.px40
        )
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor(resource: .border).cgColor
        tintColor = .clear
        textColor = UIColor(resource: .absentLetter)
        autocapitalizationType = .allCharacters

        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc private func textFieldDidChange() {
        if let text = text, !text.isEmpty {
            activeNextField.send(tag)
            resignFirstResponder()
        }
    }

    override func deleteBackward() {
        if text?.isEmpty == false {
            super.deleteBackward()
        } else {
            activePreviousField.send(tag)
        }
    }
}
