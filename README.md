# LemonTree

Display Markdown using UIKit 🍋

# WHY?

This can potentially provide more configuration options than presenting Markdown in a webview or with one attributed string.

By using `UIStackView` to build a Markdown view, there are situations where you could: add a `UIView` with a configured spacer height (ex: GitHub Markdown does this after H1 and H2 headers), create a custom `UIView` for displaying your code blocks, or insert a `UIImageView` for inline images, and find opportunities for customization using `UIKit`.

# Usage

```swift
  let string = "I am some **Markdown** _text_ right here"
  let document = try Document(string)
  let styling = LemonTreeStyling() // configurable
  let lemonView: UIView = try LemonTree.generateView(for: document, styling: styling)
```

# Markdown

## Supported

- [x] Headings
- [x] Inline Code
- [x] Links (openable)
- [x] _Emphasis_, __Strong__
- [x] Lists (bulleted and ordered)
- [x] Ordered Lists
- [x] Images (local)

## Next

- [ ] Block quotes
- [ ] Multi-level lists
- [ ] Code blocks
- [ ] Remote images (and gifs)

## Unsupported

- [ ] HTML

.. and a few more that aren't listed

# Platforms

- [x] iOS 13.0+
- [ ] macOS

# Installation

Use the URL from this repository to add using [Swift Package Manager](https://swift.org/package-manager/) 

# Credit

[CommonMark](https://github.com/SwiftDocOrg/CommonMark) - generates the Markdown Document for rendering

[CommonMarkAttributedString](https://github.com/mattt/CommonMarkAttributedString) - the logic for generating attributed strings for nodes (especially this [file](https://github.com/mattt/CommonMarkAttributedString/blob/master/Sources/CommonMarkAttributedString/CommonMark%2BExtensions.swift))

[Parma](https://github.com/dasautoooo/Parma) - thank you for the inspo. I thought this was a fun/maybe good idea but got hung up trying to do some of the work unrelated to the final step
