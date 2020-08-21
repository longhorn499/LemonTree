# LemonTree

Display Markdown using UIKit views, not webviews 🍋

# Installation

(SPM + CocoaPods)

# Usage

```swift
  let markdown = "**hello** world!"
  let view = LemonTreeView()
  view.configure(markdown)
```

# Credit

[Parma](https://github.com/dasautoooo/Parma) - thank you for the inspo. I thought this was a good idea but got hung up trying to do Markdown AST generation myself, when I really just cared about the final step (displaying Markdown beautifully in native views).

[Down](https://github.com/iwasrobbed/Down) - generates the AST for rendering

# Name

I'm growing a lemon tree and this sounds nicer than "MarkdownViewSwift"
