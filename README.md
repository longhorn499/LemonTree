# LemonTree

Display Markdown using UIKit views, not webviews 🍋

# WHY

# Status

## Supported

- [x] Headers


## Unsupported

- [ ] Images

# Installation

(SPM + CocoaPods)

# Usage

```swift
  let markdown = "**hello** world!"
  let view = LemonTreeView()
  view.configure(markdown)
```

# Credit

[Parma](https://github.com/dasautoooo/Parma) - thank you for the inspo. I thought this was a good idea but got hung up trying to do Markdown AST generation myself when I really just cared about the final step (displaying Markdown beautifully in native views).

[SwiftDocOrg/CommonMark](https://github.com/SwiftDocOrg/CommonMark) - generates the Markdown document/structure to render

++ that MarkdownParser that did AST generation..

https://github.com/mattt/CommonMarkAttributedString/blob/master/Sources/CommonMarkAttributedString/CommonMark%2BExtensions.swift

# Name

I'm growing a lemon tree and this sounds nicer than "MarkdownViewSwift"
