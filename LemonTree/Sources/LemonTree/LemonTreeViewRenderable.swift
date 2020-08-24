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
    func markdownViews() -> [UIView]
}

// MARK: - Heading

extension Heading: LemonTreeViewRenderable {
    func markdownViews() -> [UIView] {
        let stackView = UIStackView()
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.axis = .horizontal

        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        let headingFont = LemonTreeStyling.headingFont(for: level)
        let headingTextStyle = LemonTreeStyling.headingTextStyle(for: level)
        let headingTextColor = LemonTreeStyling.headingTextColor(for: level)
        let attrString = children.map {
            $0.attributedString(
                attributes: [
                    .font: headingFont.scaledFont(for: headingTextStyle),
                    .foregroundColor: headingTextColor
                ],
                textStyle: headingTextStyle
            ) }
            .joined()
        label.attributedText = attrString
        stackView.addArrangedSubview(label)

        switch level {
        case 1, 2:
            // TODO: this applies GH-flavored markdown, need to read spec and see what's okay..
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
    func markdownViews() -> [UIView] {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIStackView.spacingUseSystem

        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        let attrString = self.children.map {
            $0.attributedString(
                attributes: [
                    .font: LemonTreeStyling.bodyFont.scaledFont(for: LemonTreeStyling.bodyTextStyle),
                    .foregroundColor: LemonTreeStyling.bodyTextColor
                ],
                textStyle: LemonTreeStyling.bodyTextStyle
            ) }
            .joined()
        label.attributedText = attrString
        stackView.addArrangedSubview(label)
        return [stackView]
    }
}

// MARK: - List

extension List: LemonTreeViewRenderable {
    func markdownViews() -> [UIView] {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseDefault

        for (index, child) in children.enumerated() {
            let label = UILabel()
            label.adjustsFontForContentSizeCategory = true
            label.numberOfLines = 0
            label.textAlignment = .left
            let attrString = child.attributedString(
                attributes: [
                    .font: LemonTreeStyling.bodyFont.scaledFont(for: LemonTreeStyling.bodyTextStyle),
                    .foregroundColor: LemonTreeStyling.bodyTextColor
                ],
                textStyle: LemonTreeStyling.bodyTextStyle,
                position: index + 1
            )
            label.attributedText = attrString
            stackView.addArrangedSubview(label)
        }
        return [stackView]
    }
}

#endif
