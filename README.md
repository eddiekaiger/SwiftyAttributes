# SwiftyAttributes

#### *A Swifty API for attributed strings.*

![Swift Version](https://img.shields.io/badge/swift-5-orange.svg?style=flat)
![Swift Version](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyAttributes.svg)](https://img.shields.io/cocoapods/v/SwiftyAttributes.svg)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyAttributes.svg?style=flat)](http://cocoapods.org/pods/SwiftyAttributes)
[![Travis CI](https://travis-ci.org/eddiekaiger/SwiftyAttributes.svg?branch=master)](https://travis-ci.org/eddiekaiger/SwiftyAttributes.svg?branch=master)
[![codecov.io](http://codecov.io/github/eddiekaiger/SwiftyAttributes/coverage.svg?branch=master)](http://codecov.io/github/eddiekaiger/SwiftyAttributes/coverage.svg?branch=master)

---

With **SwiftyAttributes**, you can create attributed strings like so:

````swift
let fancyString = "Hello World!".withTextColor(.blue).withUnderlineStyle(.styleSingle)
````

Alternatively, use the `Attribute` enum:
````swift
let fancyString = "Hello World!".withAttributes([
    .backgroundColor(.magenta),
    .strokeColor(.orange),
    .strokeWidth(1),
    .baselineOffset(5.2)
])
````

You can also easily combine attributed strings using a plus sign:

````swift
let fancyString = "Hello".withFont(.systemFont(ofSize: 12)) + " World!".withFont(.systemFont(ofSize: 18))
````

**SwiftyAttributes** has support for *every* attribute available in Cocoa and Cocoa Touch.

# Requirements

* iOS 8.0+, macOS 10.11+, watchOS 2.0+, tvOS 9.0+
* Swift 4.2+
* Xcode 10.0+

# Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/eddiekaiger/SwiftyAttributes.git", from: "5.3.0")
]
```

### With CocoaPods

`pod 'SwiftyAttributes'`

### With Carthage

`github "eddiekaiger/SwiftyAttributes"`

# Usage

Initializing attributed strings in `SwiftyAttributes` can be done several ways:

- Using the `with[Attribute]` extensions:
    ````swift
    "Hello World".withUnderlineColor(.red).withUnderlineStyle(.styleDouble)
    ````

- Using the `Attribute` enum extensions:
    ````swift
    "Hello World".withAttributes([.underlineColor(.red), .underlineStyle(.styleDouble)])
    ````

- Using the `Attribute` enum in an initializer:
    ````swift
    NSAttributedString(string: "Hello World", swiftyAttributes: [.kern(5), .backgroundColor(.gray)])
    ````
    
You can retrieve the attribute at a specific location using the built-in `NSAttributedString.Key` enum:
````swift
let attr: Attribute? = myAttributedString.swiftyAttribute(.shadow, at: 5)
````

Several API methods are provided to use these new enums as well as Swift's `Range` type instead of `NSRange`. Some of the method signatures include:

````swift
extension NSMutableAttributedString {
    func addAttributes(_ attributes: [Attribute], range: Range<Int>)
    func addAttributes(_ attributes: [Attribute], range: NSRange)
    func setAttributes(_ attributes: [Attribute], range: Range<Int>)
    func setAttributes(_ attributes: [Attribute], range: NSRange)
    func replaceCharacters(in range: Range<Int>, with str: String)
    func replaceCharacters(in range: Range<Int>, with attrString: NSAttributedString)
    func deleteCharacters(in range: Range<Int>)
    func removeAttribute(_ name: NSAttributedStringKey, range: Range<Int>)
}

extension NSAttributedString {
    convenience init(string str: String, swiftyAttributes: [Attribute])
    func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString
    func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString
    func attributedSubstring(from range: Range<Int>) -> NSAttributedString
    func swiftyAttribute(_ attrName: NSAttributedStringKey, at location: Int, effectiveRange range: NSRangePointer? = nil) -> Attribute?
    func swiftyAttributes(in range: Range<Int>, options: NSAttributedString.EnumerationOptions = []) -> [([Attribute], Range<Int>)]
    func enumerateSwiftyAttributes(in enumerationRange: Range<Int>, options: NSAttributedString.EnumerationOptions = [], using block: (_ attrs: [Attribute], _ range: Range<Int>, _ stop: UnsafeMutablePointer<ObjCBool>) -> Void)
    func enumerateSwiftyAttribute(_ attrName: NSAttributedStringKey, in enumerationRange: Range<Int>, options: NSAttributedString.EnumerationOptions = [], using block: (_ value: Any?, _ range: Range<Int>, _ stop: UnsafeMutablePointer<ObjCBool>) -> Void)
}

extension String {
    var attributedString: NSMutableAttributedString
    func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString
    func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString
}

// ... and more!

````

# Support

For questions, support, and suggestions, please open up an issue.

# License

**SwiftyAttributes** is available under the MIT license. See the LICENSE file for more info.
