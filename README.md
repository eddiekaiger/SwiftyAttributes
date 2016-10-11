# SwiftyAttributes

#### *Swift extensions that make it a breeze to work with attributed strings.*

![Swift Version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyAttributes.svg)](https://img.shields.io/cocoapods/v/SwiftyAttributes.svg)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyAttributes.svg?style=flat)](http://cocoapods.org/pods/SwiftyAttributes)

---

The **original** way to create an attributed string in Swift:

````swift
let attributes: [String: AnyObject] = [
    NSForegroundColorAttributeName: UIColor.blue, 
    NSUnderlineStyleAttributeName:  NSNumber(value: NSUnderlineStyle.styleSingle.rawValue)
]
let fancyString = NSAttributedString(string: "Hello World!", attributes: attributes) 
````

With **SwiftyAttributes**, you can write the same thing like this:

````swift
let fancyString = "Hello World!".withTextColor(.blue).withUnderlineStyle(.styleSingle)
````

You can also easily combine attributed strings using a plus sign:

````swift
let fancyString = "Hello".withFont(.systemFont(ofSize: 12)) + " World!".withFont(.systemFont(ofSize: 18))
````

**SwiftyAttributes** Has support for *every* attribute that can be used in iOS.

# Installation

### With CocoaPods:

#### For **Swift 3**:

`pod 'SwiftyAttributes'`

> For **Swift 2.3**:

> `pod 'SwiftyAttributes', '1.1'`

> If using Xcode 8, you may need to add this to end of your Podfile:

> ```swift
> post_install do |installer|
>     installer.pods_project.targets.each do |target| 
>         target.build_configurations.each do |config| 
>             config.build_settings["SWIFT_VERSION"] = "2.3"
>         end
>     end
> end
> ```

# TODO

* Add Carthage support
* Write tests for overloaded addition operator

# Support

For questions and support, please open up an issue.

# License

SwiftyAttributes is available under the MIT license. See the LICENSE file for more info.
