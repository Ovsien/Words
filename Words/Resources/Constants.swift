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

public enum Constants {
    // MARK: - Fonts
    enum Fonts {
        static let inter_medium = "inter-medium"
    }

    // MARK: - Font Size
    enum FontSize {
        static let px18: CGFloat = 18
        static let px40: CGFloat = 40
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
}
