//
//  UIStackView+Extensions.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

#endif
