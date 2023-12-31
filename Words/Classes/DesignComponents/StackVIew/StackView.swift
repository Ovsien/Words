//
//  StackView.swift
//  Words
//
//  Created by Alexandr Ovsienko on 01.12.2023.
//

import UIKit

final class StackView: UIStackView {
    init(
        alignment: Alignment = .fill,
        axis: NSLayoutConstraint.Axis = .horizontal,
        spacing: CGFloat,
        distribution: UIStackView.Distribution
    ) {
        super.init(frame: .zero)
        self.alignment = alignment
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
