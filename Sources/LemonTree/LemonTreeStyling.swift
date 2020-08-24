//
//  LemonTreeStyling.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

#if canImport(UIKit)
import UIKit

struct LemonTreeStyling {
    let heading1Font: UIFont
    let heading1TextStyle: UIFont.TextStyle
    let heading1TextColor: UIColor
    
    let heading2Font: UIFont
    let heading2TextStyle: UIFont.TextStyle
    let heading2TextColor: UIColor
    
    let heading3Font: UIFont
    let heading3TextStyle: UIFont.TextStyle
    let heading3TextColor: UIColor

    let heading4Font: UIFont
    let heading4TextStyle: UIFont.TextStyle
    let heading4TextColor: UIColor
    
    let heading5Font: UIFont
    let heading5TextStyle: UIFont.TextStyle
    let heading5TextColor: UIColor

    let heading6Font: UIFont
    let heading6TextStyle: UIFont.TextStyle
    let heading6TextColor: UIColor
    
    let bodyFont: UIFont
    let bodyTextStyle: UIFont.TextStyle
    let bodyTextColor: UIColor

    // TODO: need to inset space between text and background
    let inlineCodeFont: UIFont
    let inlineCodeTextStyle: UIFont.TextStyle
    let inlineCodeTextColor: UIColor
    let inlineCodeBackgroundColor: UIColor

    init(
        heading1Font: UIFont = UIFont.systemFont(ofSize: 28, weight: .bold),
        heading1TextStyle: UIFont.TextStyle = .title1,
        heading1TextColor: UIColor = .label,
        heading2Font: UIFont = UIFont.systemFont(ofSize: 22, weight: .bold),
        heading2TextStyle: UIFont.TextStyle = .title2,
        heading2TextColor: UIColor = .label,
        heading3Font: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold),
        heading3TextStyle: UIFont.TextStyle = .title3,
        heading3TextColor: UIColor = .label,
        heading4Font: UIFont = UIFont.systemFont(ofSize: 17, weight: .bold),
        heading4TextStyle: UIFont.TextStyle = .headline,
        heading4TextColor: UIColor = .label,
        heading5Font: UIFont = UIFont.systemFont(ofSize: 15, weight: .bold),
        heading5TextStyle: UIFont.TextStyle = .subheadline,
        heading5TextColor: UIColor = .label,
        heading6Font: UIFont = UIFont.systemFont(ofSize: 13, weight: .bold),
        heading6TextStyle: UIFont.TextStyle = .footnote,
        heading6TextColor: UIColor = .secondaryLabel,
        bodyFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .regular),
        bodyTextStyle: UIFont.TextStyle = .body,
        bodyTextColor: UIColor = .label,
        inlineCodeFont: UIFont = UIFont.monospacedSystemFont(ofSize: 15, weight: .light),
        inlineCodeTextStyle: UIFont.TextStyle = .body,
        inlineCodeTextColor: UIColor = .systemGray3,
        inlineCodeBackgroundColor: UIColor = .systemGray6
    ) {
        self.heading1Font = heading1Font
        self.heading1TextStyle = heading1TextStyle
        self.heading1TextColor = heading1TextColor
        self.heading2Font = heading2Font
        self.heading2TextStyle = heading2TextStyle
        self.heading2TextColor = heading2TextColor
        self.heading3Font = heading3Font
        self.heading3TextStyle = heading3TextStyle
        self.heading3TextColor = heading3TextColor
        self.heading4Font = heading4Font
        self.heading4TextStyle = heading4TextStyle
        self.heading4TextColor = heading4TextColor
        self.heading5Font = heading5Font
        self.heading5TextStyle = heading5TextStyle
        self.heading5TextColor = heading5TextColor
        self.heading6Font = heading6Font
        self.heading6TextStyle = heading6TextStyle
        self.heading6TextColor = heading6TextColor
        self.bodyFont = bodyFont
        self.bodyTextStyle = bodyTextStyle
        self.bodyTextColor = bodyTextColor
        self.inlineCodeFont = inlineCodeFont
        self.inlineCodeTextStyle = inlineCodeTextStyle
        self.inlineCodeTextColor = inlineCodeTextColor
        self.inlineCodeBackgroundColor = inlineCodeBackgroundColor
    }
}

extension LemonTreeStyling {
    func headingFont(for level: Int) -> UIFont {
        switch level {
        case 1:
            return heading1Font
        case 2:
            return heading2Font
        case 3:
            return heading3Font
        case 4:
            return heading4Font
        case 5:
            return heading5Font
        case 6:
            return heading6Font
        default:
            preconditionFailure()
        }
    }

    func headingTextStyle(for level: Int) -> UIFont.TextStyle {
        switch level {
        case 1:
            return heading1TextStyle
        case 2:
            return heading2TextStyle
        case 3:
            return heading3TextStyle
        case 4:
            return heading4TextStyle
        case 5:
            return heading5TextStyle
        case 6:
            return heading6TextStyle
        default:
            preconditionFailure()
        }
    }

    func headingTextColor(for level: Int) -> UIColor {
        switch level {
        case 1:
            return heading1TextColor
        case 2:
            return heading2TextColor
        case 3:
            return heading3TextColor
        case 4:
            return heading4TextColor
        case 5:
            return heading5TextColor
        case 6:
            return heading6TextColor
        default:
            preconditionFailure()
        }
    }
}

#endif
