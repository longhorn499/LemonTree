//
//  LemonTreeViewRenderable.swift
//  LemonTree 
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import CommonMark

protocol LemonTreeViewRenderable {
    func markdownViews(styling: LemonTreeStyling) -> [UIView]
}

func defaultTextView() -> UITextView {
    let textView = UITextView()
    textView.isScrollEnabled = false
    textView.isEditable = false
    textView.adjustsFontForContentSizeCategory = true
    // label.numberOfLines = 0
    textView.textAlignment = .left
    textView.textContainerInset = .zero
    return textView
}

// MARK: - Heading

extension Heading: LemonTreeViewRenderable {
    func markdownViews(styling: LemonTreeStyling) -> [UIView] {
        let stackView = UIStackView()
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.axis = .horizontal

        let textView = defaultTextView()
        let headingFont = styling.headingFont(for: level)
        let headingTextStyle = styling.headingTextStyle(for: level)
        let headingTextColor = styling.headingTextColor(for: level)
        let attrString = children.map {
            $0.attributedString(
                attributes: [
                    .font: headingFont.scaledFont(for: headingTextStyle),
                    .foregroundColor: headingTextColor
                ],
                textStyle: headingTextStyle,
                styling: styling
            )
        }.joined()
        textView.attributedText = attrString
        stackView.addArrangedSubview(textView)

        switch level {
        case 1, 2:
            // TODO: this applies GH-flavored markdown, need to read spec and see what's okay
            let spacer = UIView()
            spacer.backgroundColor = .separator
            NSLayoutConstraint.activate([
                spacer.heightAnchor.constraint(equalToConstant: 1)
            ])
            return [stackView, spacer]
        case 3, 4, 5, 6:
            return [stackView]
        default:
            preconditionFailure("Invalid header level")
        }
    }
}

// MARK: - Paragraph

extension Paragraph: LemonTreeViewRenderable {
    func markdownViews(styling: LemonTreeStyling) -> [UIView] {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIStackView.spacingUseSystem

        let textView = defaultTextView()
        let attrString = self.children.map {
            $0.attributedString(
                attributes: [
                    .font: styling.bodyFont.scaledFont(for: styling.bodyTextStyle),
                    .foregroundColor: styling.bodyTextColor
                ],
                textStyle: styling.bodyTextStyle,
                styling: styling
            )
        }.joined()
        textView.attributedText = attrString
        stackView.addArrangedSubview(textView)
        return [stackView]
    }
}

// MARK: - List

extension List: LemonTreeViewRenderable {
    func markdownViews(styling: LemonTreeStyling) -> [UIView] {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseDefault

        for (index, child) in children.enumerated() {
            let textView = defaultTextView()
            let attrString = child.attributedString(
                attributes: [
                    .font: styling.bodyFont.scaledFont(for: styling.bodyTextStyle),
                    .foregroundColor: styling.bodyTextColor
                ],
                textStyle: styling.bodyTextStyle,
                position: index + 1,
                styling: styling
            )
            textView.attributedText = attrString
            stackView.addArrangedSubview(textView)
        }
        return [stackView]
    }
}

// MARK: - BlockQuote

extension BlockQuote: LemonTreeViewRenderable {
    func markdownViews(styling: LemonTreeStyling) -> [UIView] {
        // TODO: Next up
        return []
    }
}

#endif
