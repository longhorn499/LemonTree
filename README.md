# LemonTree

Display Markdown using UIKit views 🍋

# WHY?

This can potentially be nice and provide more configuration/customization options in a simpler way than presenting Markdown in webview or with one attributed string. By using `UIStackView` and constructing the Markdown view this way, there are situations where you can add a `UIView` with a configured spacer height (ex: GitHub Markdown does this for H1 and H2 headesrs), or insert a `UIImageView` for inline images, create a custom `UIView` for displaying code blocks, and again provide some customization/styling using `UIKit`.

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
- [x] Bulleted Lists
- [x] Ordered Lists
- [x] Images (local)

## Next

- [ ] Block quotes
- [ ] Remote images (and gifs)
- [ ] Code blocks

## Unsupported

- [ ] HTML?

# Installation

Use the URL from this repository to add using Swift Package Manager 

# Credit

[CommonMark](https://github.com/SwiftDocOrg/CommonMark) - generates the Markdown Document for rendering
[CommonMarkAttributedString](https://github.com/mattt/CommonMarkAttributedString) - the logic for generating attributed strings for nodes (especially this [file](https://github.com/mattt/CommonMarkAttributedString/blob/master/Sources/CommonMarkAttributedString/CommonMark%2BExtensions.swift))
[Parma](https://github.com/dasautoooo/Parma) - thank you for the inspo. I thought this was a fun/maybe good idea but got hung up trying to do some of the work unrelated to the final step.
