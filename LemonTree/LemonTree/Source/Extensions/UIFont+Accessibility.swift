//
//  UIFont+Accessibility.swift
//  MarkdownViewSwift
//
//  Created by Kevin Johnson on 8/31/19.
//  Copyright © 2019 Kevin Johnson. All rights reserved.
//

import UIKit

extension UIFont {
    func scaledFont(for textStyle: UIFont.TextStyle) -> UIFont {
        return textStyle.fontMetrics.scaledFont(for: self)
    }
}

extension UIFont.TextStyle {
    var fontMetrics: UIFontMetrics {
        return UIFontMetrics(forTextStyle: self)
    }
}
