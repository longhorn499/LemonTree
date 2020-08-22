//
//  LemonTree.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import Foundation
import CommonMark

class LemonTree {

    enum DocumentError: LocalizedError {
        case generic(String)
        case nilString
    }

    func test() throws -> Document {
        let url = Bundle.main.url(forResource: "test", withExtension: "md")!
        if let string = try url.string() {
            let document = try Document(string)
            return document
        } else {
            throw DocumentError.nilString
        }
    }
}

//                case CMARK_NODE_DOCUMENT:       return Document(cmarkNode: self)
//                case CMARK_NODE_BLOCK_QUOTE:    return BlockQuote(cmarkNode: self)
//                case CMARK_NODE_ITEM:           return Item(cmarkNode: self)
//                case CMARK_NODE_CODE_BLOCK:     return CodeBlock(cmarkNode: self)
//                case CMARK_NODE_HTML_BLOCK:     return HtmlBlock(cmarkNode: self)
//                case CMARK_NODE_CUSTOM_BLOCK:   return CustomBlock(cmarkNode: self)
//                case CMARK_NODE_THEMATIC_BREAK: return ThematicBreak(cmarkNode: self)
//                case CMARK_NODE_SOFTBREAK:      return SoftBreak(cmarkNode: self)
//                case CMARK_NODE_LINEBREAK:      return LineBreak(cmarkNode: self)
//                case CMARK_NODE_CODE:           return Code(cmarkNode: self)
//                case CMARK_NODE_HTML_INLINE:    return HtmlInline(cmarkNode: self)
//                case CMARK_NODE_CUSTOM_INLINE:  return CustomInline(cmarkNode: self)
