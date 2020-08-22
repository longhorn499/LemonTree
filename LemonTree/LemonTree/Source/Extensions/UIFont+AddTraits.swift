//
//  UIFont+AddTraits.swift
//  MarkdownViewSwift
//
//  Created by Kevin Johnson on 9/19/19.
//  Copyright © 2019 Kevin Johnson. All rights reserved.
//

import UIKit

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
