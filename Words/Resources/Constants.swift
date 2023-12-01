//
//  Constants.swift
//  Words
//
//  Created by Alexandr Ovsienko on 29.11.2023.
//

import UIKit

// MARK: - Typealiases
typealias Fonts = Constants.Fonts
typealias FontSize = Constants.FontSize
typealias Colors = Constants.Colors
typealias Spacing = Constants.Spacing
typealias CornerRadius = Constants.CornerRadius
typealias EdgesInset = Constants.EdgesInset
typealias Height = Constants.Height

public enum Constants {
    // MARK: - Fonts
    enum Fonts {
        static let inter_medium = "Inter-Medium"
    }

    // MARK: - Font Size
    enum FontSize {
        static let px18: CGFloat = 18
        static let px40: CGFloat = 40
    }

    enum Spacing {
        static let px18: CGFloat = 18
        static let px6: CGFloat = 6
    }

    // MARK: - Colors
    enum Colors {
        static let absentBackgroundFieldColor: UIColor = UIColor(named: "AbsentBackgroundFieldColor")!
        static let absentLetterColor: UIColor = UIColor(named: "AbsentLetterColor")!
        static let buttonBackgroundColor: UIColor = UIColor(named: "ButtonBackgroundColor")!
        static let buttonTextColor: UIColor = UIColor(named: "ButtonTextColor")!
        static let containedLetterColor: UIColor = UIColor(named: "ContainedLetterColor")!
        static let primaryBackgroundColor: UIColor = UIColor(named: "PrimaryBackgroundColor")!
        static let rightPlaceBackgroundFieldColor: UIColor = UIColor(named: "RightPlaceBackgroundFieldColor")!
        static let wrongPlaceBackgroundFieldColor: UIColor = UIColor(named: "WrongPlaceBackgroundFieldColor")!
    }

    // MARK: - CornerRadius
    enum CornerRadius {
        static let px16: CGFloat = 16
        static let px4: CGFloat = 4
    }

    enum EdgesInset {
        static let px40: CGFloat = 40
    }

    enum Height {
        static let px56: CGFloat = 56
    }
}
