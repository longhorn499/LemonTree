//
//  URL+Extensions.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/22/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import Foundation

extension URL {
    func string(encoding: String.Encoding = .utf8) throws -> String? {
        let data = try Data(contentsOf: self)
        return String(data: data, encoding: encoding)
    }
}
