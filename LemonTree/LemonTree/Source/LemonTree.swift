//
//  LemonTree.swift
//  LemonTree
//
//  Created by Kevin Johnson on 8/21/20.
//  Copyright © 2020 Kevin Johnson. All rights reserved.
//

import Foundation
import Down

class LemonTree {

    func markdownString(from url: URL, encoding: String.Encoding = .utf8) throws -> String? {
        let data = try Data(contentsOf: url)
        return String(data: data, encoding: encoding)
    }

    func test() {
        let url = Bundle.main.url(forResource: "test", withExtension: "md")!
        do {
            let mdString = try markdownString(from: url) ?? ""
            let down = Down(markdownString: mdString)
            let ast = try down.toAST()
            let parent = ast.wrap()
            print(parent?.children)
            for child in parent?.children ?? [] {
                // can make this like a switch?
                // ++ recursive for all
                if let paragraph = child as? Paragraph {
                    print("paragraph")
                } else if let list = child as? List {
                    print("list")
                } else if let text = child as? Text {
                    print("text")
                }


//                case CMARK_NODE_DOCUMENT:       return Document(cmarkNode: self)
//                case CMARK_NODE_BLOCK_QUOTE:    return BlockQuote(cmarkNode: self)
//                case CMARK_NODE_ITEM:           return Item(cmarkNode: self)
//                case CMARK_NODE_CODE_BLOCK:     return CodeBlock(cmarkNode: self)
//                case CMARK_NODE_HTML_BLOCK:     return HtmlBlock(cmarkNode: self)
//                case CMARK_NODE_CUSTOM_BLOCK:   return CustomBlock(cmarkNode: self)
//                case CMARK_NODE_HEADING:        return Heading(cmarkNode: self)
//                case CMARK_NODE_THEMATIC_BREAK: return ThematicBreak(cmarkNode: self)
//                case CMARK_NODE_SOFTBREAK:      return SoftBreak(cmarkNode: self)
//                case CMARK_NODE_LINEBREAK:      return LineBreak(cmarkNode: self)
//                case CMARK_NODE_CODE:           return Code(cmarkNode: self)
//                case CMARK_NODE_HTML_INLINE:    return HtmlInline(cmarkNode: self)
//                case CMARK_NODE_CUSTOM_INLINE:  return CustomInline(cmarkNode: self)
//                case CMARK_NODE_EMPH:           return Emphasis(cmarkNode: self)
//                case CMARK_NODE_STRONG:         return Strong(cmarkNode: self)
//                case CMARK_NODE_LINK:           return Link(cmarkNode: self)
//                case CMARK_NODE_IMAGE:          return Image(cmarkNode: self)
            }

        } catch {
            print(error)
        }
    }
}
