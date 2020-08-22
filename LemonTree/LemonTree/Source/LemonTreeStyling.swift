//
//  LemonTreeStyling.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//
import UIKit

// TODO: Good way 2 modify.. shared update etc
struct LemonTreeStyling {
    static var heading1Font: UIFont = UIFont.systemFont(ofSize: 28, weight: .bold)
    static var heading1TextStyle: UIFont.TextStyle = .title1
    static var heading1TextColor: UIColor = .label
    
    static var heading2Font: UIFont = UIFont.systemFont(ofSize: 22, weight: .bold)
    static var heading2TextStyle: UIFont.TextStyle = .title2
    static var heading2TextColor: UIColor = .label
    
    static var heading3Font: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static var heading3TextStyle: UIFont.TextStyle = .title3
    static var heading3TextColor: UIColor = .label

    static var heading4Font: UIFont = UIFont.systemFont(ofSize: 17, weight: .bold)
    static var heading4TextStyle: UIFont.TextStyle = .headline
    static var heading4TextColor: UIColor = .label
    
    static var heading5Font: UIFont = UIFont.systemFont(ofSize: 15, weight: .bold)
    static var heading5TextStyle: UIFont.TextStyle = .subheadline
    static var heading5TextColor: UIColor = .label

    static var heading6Font: UIFont = UIFont.systemFont(ofSize: 13, weight: .bold)
    static var heading6TextStyle: UIFont.TextStyle = .footnote
    static var heading6TextColor: UIColor = .secondaryLabel
    
    static var bodyFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .regular)
    static var bodyTextStyle: UIFont.TextStyle = .body
    static var bodyTextColor: UIColor = .label

    // TODO: need to inset a little bet, space between text and background
    static var inlineCodeFont: UIFont = UIFont.monospacedSystemFont(ofSize: 15, weight: .light)
    static var inlineCodeTextStyle: UIFont.TextStyle = .body
    static var inlineCodeTextColor: UIColor = .systemGray3
    static var inlineCodeBackgroundColor: UIColor = .systemGray6
}

extension LemonTreeStyling {
    static func headingFont(for level: Int) -> UIFont {
        switch level {
        case 1:
            return LemonTreeStyling.heading1Font
        case 2:
            return LemonTreeStyling.heading2Font
        case 3:
            return LemonTreeStyling.heading3Font
        case 4:
            return LemonTreeStyling.heading4Font
        case 5:
            return LemonTreeStyling.heading5Font
        case 6:
            return LemonTreeStyling.heading6Font
        default:
            preconditionFailure()
        }
    }

    static func headingTextStyle(for level: Int) -> UIFont.TextStyle {
        switch level {
        case 1:
            return LemonTreeStyling.heading1TextStyle
        case 2:
            return LemonTreeStyling.heading2TextStyle
        case 3:
            return LemonTreeStyling.heading3TextStyle
        case 4:
            return LemonTreeStyling.heading4TextStyle
        case 5:
            return LemonTreeStyling.heading5TextStyle
        case 6:
            return LemonTreeStyling.heading6TextStyle
        default:
            preconditionFailure()
        }
    }

    static func headingTextColor(for level: Int) -> UIColor {
        switch level {
        case 1:
            return LemonTreeStyling.heading1TextColor
        case 2:
            return LemonTreeStyling.heading2TextColor
        case 3:
            return LemonTreeStyling.heading3TextColor
        case 4:
            return LemonTreeStyling.heading4TextColor
        case 5:
            return LemonTreeStyling.heading5TextColor
        case 6:
            return LemonTreeStyling.heading6TextColor
        default:
            preconditionFailure()
        }
    }
}
