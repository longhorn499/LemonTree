//
//  Node+AttributedString.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import UIKit
import CommonMark

// https://github.com/mattt/CommonMarkAttributedString/blob/master/Sources/CommonMarkAttributedString/CommonMark%2BExtensions.swift

extension Node {
    func attributedString(
        attributes: [NSAttributedString.Key: Any],
        attachments: [String: NSTextAttachment] = [:],
        textStyle: UIFont.TextStyle
    ) -> NSAttributedString {
        // TODO: handle line breaks! lots more..

        let currentFont = attributes[NSAttributedString.Key.font] as? UIFont ??
            UIFont.systemFont(ofSize: 17, weight: .regular)
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
            // should generate title w/ bold and italic?.. title..
            return NSAttributedString(string: "LINK", attributes: attributes)

        case let image as Image:
            guard let urlString = image.urlString else { return NSAttributedString() }
            guard let attachment = attachments[urlString] else { return NSAttributedString(string: "Missing attachment for \(urlString)") }
            return NSAttributedString(attachment: attachment)

        case _ as Code:
            // use Code fonts from MarkdownStyling!
            return NSAttributedString(string: "CODE")

        default:
            return NSAttributedString(string: "Unhandled")
        }
    }
}
