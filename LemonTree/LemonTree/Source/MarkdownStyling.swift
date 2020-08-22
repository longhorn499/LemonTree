//
//  MarkdownStyling.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//
import UIKit

/// Good way 2 modify.. shared update etc
struct MarkdownStyling {
    static var heading1Font: UIFont = UIFont.systemFont(ofSize: 28, weight: .regular) // .bold
    static var heading1TextStyle: UIFont.TextStyle = .title1
    static var heading1TextColor: UIColor = .label
    
    static var heading2Font: UIFont = UIFont.systemFont(ofSize: 22, weight: .regular) // .bold
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
    
    static var inlineCodeFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .light)
    static var inlineCodeTextStyle: UIFont.TextStyle = .body
    static var inlineCodeTextColor: UIColor = .systemGray3
    static var inlineCodeBackgroundColor: UIColor = .systemGray6
}

extension MarkdownStyling {
    static func headingFont(for level: Int) -> UIFont {
        switch level {
        case 1:
            return MarkdownStyling.heading1Font
        case 2:
            return MarkdownStyling.heading2Font
        case 3:
            return MarkdownStyling.heading3Font
        case 4:
            return MarkdownStyling.heading4Font
        case 5:
            return MarkdownStyling.heading5Font
        case 6:
            return MarkdownStyling.heading6Font
        default:
            preconditionFailure()
        }
    }

    static func headingTextStyle(for level: Int) -> UIFont.TextStyle {
        switch level {
        case 1:
            return MarkdownStyling.heading1TextStyle
        case 2:
            return MarkdownStyling.heading2TextStyle
        case 3:
            return MarkdownStyling.heading3TextStyle
        case 4:
            return MarkdownStyling.heading4TextStyle
        case 5:
            return MarkdownStyling.heading5TextStyle
        case 6:
            return MarkdownStyling.heading6TextStyle
        default:
            preconditionFailure()
        }
    }

    static func headingTextColor(for level: Int) -> UIColor {
        switch level {
        case 1:
            return MarkdownStyling.heading1TextColor
        case 2:
            return MarkdownStyling.heading2TextColor
        case 3:
            return MarkdownStyling.heading3TextColor
        case 4:
            return MarkdownStyling.heading4TextColor
        case 5:
            return MarkdownStyling.heading5TextColor
        case 6:
            return MarkdownStyling.heading6TextColor
        default:
            preconditionFailure()
        }
    }
}
