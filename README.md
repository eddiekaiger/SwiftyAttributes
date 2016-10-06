# SwiftyAttributes

###### *Swift extensions that make it a breeze to work with attributed strings.*

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

**With CocoaPods:**

`pod 'SwiftyAttributes'`

**Manually:**

Download the zip file (or clone the project), and drag all of the swift files from the *SwiftyAttributes* folder into your project.


# Contact

Eddie Kaiger
* www.github.com/eddiekaiger
* eddiekaiger@gmail.com

# License

SwiftyAttributes is available under the MIT license. See the LICENSE file for more info.
