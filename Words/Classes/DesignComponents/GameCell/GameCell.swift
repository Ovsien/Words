//
//  GameCell.swift
//  Words
//
//  Created by Alexandr Ovsienko on 03.12.2023.
//

import UIKit
import SnapKit

final class GameCell: UICollectionViewCell {
    lazy var textField: TextField = {
        let textField = TextField()
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
