//
//  LemonTreeView.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import UIKit
import CommonMark

//
//  LemonTreeView.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import UIKit
import CommonMark

class LemonTreeViewFactory {

    let document: Document

    init(_ document: Document) {
        self.document = document
    }

    func generate() -> UIStackView {
        var main = UIStackView()
        main.axis = .vertical
        main.backgroundColor = .systemFill
        main.isLayoutMarginsRelativeArrangement = true
        main.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        main.spacing = UIStackView.spacingUseSystem

        for child in document.children {
            switch child {
            case let heading as Heading:
                // add protocol for view genration,, MarkdownViewRenderable?? something
                addHeadingView(for: heading, main: &main)
            case let paragraph as Paragraph:
                addParagraphView(for: paragraph, main: &main)
            case let list as List:
                // Next up!
                print("list:", list.children)
            default:
                print("unhandled", child.description)
            }
        }
        main.addArrangedSubview(UIView())
        return main
    }

    func addHeadingView(for heading: Heading, main: inout UIStackView) {
        let stackView = UIStackView()
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.axis = .horizontal

        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        let headingFont = MarkdownStyling.headingFont(for: heading.level)
        let headingTextStyle = MarkdownStyling.headingTextStyle(for: heading.level)
        let headingTextColor = MarkdownStyling.headingTextColor(for: heading.level)
        let attrString = heading.children.map {
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

        switch heading.level {
        case 1, 2:
            let spacer = UIView()
            spacer.backgroundColor = .separator
            NSLayoutConstraint.activate([
                spacer.heightAnchor.constraint(equalToConstant: 1)
            ])
            main.addArrangedSubviews([stackView, spacer])
        case 3, 4, 5, 6:
            main.addArrangedSubview(stackView)
        default:
            preconditionFailure("Invalid header level")
        }
    }

    func addParagraphView(for paragraph: Paragraph, main: inout UIStackView) {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = UIStackView.spacingUseSystem

        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        let attrString = paragraph.children.map {
            $0.attributedString(
                attributes: [
                    .font: MarkdownStyling.bodyFont.scaledFont(for: MarkdownStyling.bodyTextStyle),
                    .foregroundColor: MarkdownStyling.bodyTextColor
                ],
                textStyle: MarkdownStyling.bodyTextStyle
            ) }
            .joined()
        label.attributedText = attrString
        stackView.addArrangedSubview(label)
        main.addArrangedSubview(stackView)
    }
}
