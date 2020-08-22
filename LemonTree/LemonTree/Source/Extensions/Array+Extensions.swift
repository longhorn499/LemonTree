//
//  Array+Extensions.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import Foundation

extension Array where Element: NSAttributedString {
    func joined() -> NSAttributedString {
        let result = NSMutableAttributedString()
        for element in self {
            result.append(element)
        }
        return result
    }
}
