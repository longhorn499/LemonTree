//
//  UIFont+Extensions.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import CommonMark

// MARK: - Add Traits

extension UIFont {
    func boldFont(fontSize: CGFloat, textStyle: UIFont.TextStyle) -> UIFont? {
        return addingSymbolicTraits(.traitBold, textStyle: textStyle)
    }
    
    func italicFont(fontSize: CGFloat, textStyle: UIFont.TextStyle) -> UIFont? {
        return addingSymbolicTraits(.traitItalic, textStyle: textStyle)
    }
    
    func addingSymbolicTraits(_ traits: UIFontDescriptor.SymbolicTraits, textStyle: UIFont.TextStyle) -> UIFont? {
        let newTraits = fontDescriptor.symbolicTraits.union(traits)
        guard let descriptor = fontDescriptor.withSymbolicTraits(newTraits) else {
            return nil
        }
        return UIFont(descriptor: descriptor, size: self.pointSize).scaledFont(for: textStyle)
    }
}

// MARK: - Accessibility

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

#endif
