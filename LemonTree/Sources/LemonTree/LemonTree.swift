//
//  LemonTree.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import CommonMark

class LemonTree {
    static func generateView(
        for document: Document,
        styling: LemonTreeStyling = LemonTreeStyling(),
        layoutMargins: UIEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
    ) throws -> UIView {
        let main = UIStackView()
        main.axis = .vertical
        main.backgroundColor = .systemFill
        main.isLayoutMarginsRelativeArrangement = true
        main.layoutMargins = layoutMargins
        main.spacing = UIStackView.spacingUseSystem
        for child in document.children {
            switch child {
            case let renderable as LemonTreeViewRenderable:
                main.addArrangedSubviews(renderable.markdownViews(styling: styling))
            default:
                print("Unhandled:", child.description)
            }
        }
        main.addArrangedSubview(UIView())
        return main
    }
}

#endif
