# SwiftyAttributes

###### *Swift extensions that make it a breeze to work with attributed strings.*

The **original** way to create an attributed string in Swift:

````swift
let attributes: [String: AnyObject] = 
	[NSForegroundColorAttributeName: UIColor.blueColor(), 
     NSUnderlineStyleAttributeName:  NSNumber(integer: NSUnderlineStyle.StyleSingle.rawValue)]
let fancyString = NSAttributedString(string: "Hello World!", attributes: attributes) 
````

With **SwiftyAttributes**, you can write the same thing like this:

````swift
let fancyString = "Hello World!".withTextColor(UIColor.blueColor()).withUnderlineStyle(.StyleSingle)
````

You can also easily combine attributed strings using a plus sign:

````swift
let fancyString = "Hello".withFont(UIFont.systemFontOfSize(12)) + " World!".withFont(UIFont.systemFontOfSize(18))
````

**SwiftyAttributes** Has support for *every* attribute that can be used in iOS and OS X.

# Installation

**With CocoaPods:**

`pod 'SwiftyAttributes'`

**Manually:**

Download the zip file (or clone the project), and drag `SwiftyAttributes.swift` into your project.


# Contact

Eddie Kaiger
* www.github.com/eddiekaiger
* eddiekaiger@gmail.com

# License

SwiftyAttributes is available under the MIT license. See the LICENSE file for more info.
