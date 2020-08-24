//
//  Node+AttributedString.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import CommonMark

// https://github.com/mattt/CommonMarkAttributedString/blob/master/Sources/CommonMarkAttributedString/CommonMark%2BExtensions.swift
// not adding directly b/c implementation for images/gifs will probably change (perhaps fork)

extension Node {
    func attributedString(
        attributes: [NSAttributedString.Key: Any],
        attachments: [String: NSTextAttachment] = [:],
        textStyle: UIFont.TextStyle,
        position: Int = 0 // TODO: only for lists though, makes sense only in that context really
    ) -> NSAttributedString {
        let currentFont = attributes[.font] as? UIFont ?? UIFont.systemFont(ofSize: 17, weight: .regular)
        // TODO: do like mattt, w/ protocol that these types conform to for rendering
        switch self {
        case let text as Text:
            return NSAttributedString(string: text.literal ?? "", attributes: attributes)

        case let emphasis as Emphasis:
            var attributes = attributes
            attributes[.font] = currentFont.italicFont(fontSize: currentFont.pointSize, textStyle: textStyle)
            return emphasis.children.map { $0.attributedString(attributes: attributes, textStyle: textStyle) }.joined()

        case let strong as Strong:
            var attributes = attributes
            attributes[.font] = currentFont.boldFont(fontSize: currentFont.pointSize, textStyle: textStyle)
            return strong.children.map { $0.attributedString(attributes: attributes, textStyle: textStyle) }.joined()

        case let link as Link:
            var attributes = attributes
            if let urlString = link.urlString, let url = URL(string: urlString) {
                attributes[.link] = url
            }
            // TODO: NEXT Tapping link not working
            return link.children.map { $0.attributedString(attributes: attributes, textStyle: textStyle) }.joined()

        case let image as Image:
            // TODO: Add support for remote images/gifs
            guard let urlString = image.urlString else { return NSAttributedString() }
            let attachment: NSTextAttachment = {
                if let attachment = attachments[urlString] {
                    return attachment
                } else {
                    let attachment = NSTextAttachment()
                    let image = UIImage(named: urlString)
                    attachment.image = image
                    attachment.adjustsImageSizeForAccessibilityContentSizeCategory = true
                    return attachment
                }
            }()
            return NSAttributedString(attachment: attachment)

        case let code as Code:
            var attributes = attributes
            attributes[.font] = LemonTreeStyling.inlineCodeFont.scaledFont(for: LemonTreeStyling.inlineCodeTextStyle)
            attributes[.backgroundColor] = LemonTreeStyling.inlineCodeBackgroundColor
            attributes[.foregroundColor] = LemonTreeStyling.inlineCodeTextColor
            return NSAttributedString(string: code.literal ?? "", attributes: attributes)

        case let item as List.Item:
            let list = item.parent as! List
            let delimiter: String = list.kind == .ordered ? "\(position)." : "•"
            let indentation = String(repeating: "\t", count: list.nestingLevel)
            let mutableAttributedString = NSMutableAttributedString(string: indentation + delimiter + " ", attributes: attributes)
            let attributedString = item.children.map { $0.attributedString(attributes: attributes, textStyle: textStyle) }.joined()
            mutableAttributedString.append(attributedString)
            return mutableAttributedString

        case let paragraph as Paragraph:
            return paragraph.children.map { $0.attributedString(attributes: attributes, textStyle: textStyle) }.joined()

        default:
            return NSAttributedString(string: "Unhandled: \(self.description)")
        }
    }
}

extension List {
    fileprivate var nestingLevel: Int {
        sequence(first: self) { $0.parent }.map { ($0 is List) ? 1 : 0}.reduce(0, +)
    }
}

#endif
