
/**

The MIT License (MIT)

Copyright (c) 2015 Eddie Kaiger

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import UIKit


public extension NSAttributedString {

    fileprivate var mutableString: NSMutableAttributedString {
        return self is NSMutableAttributedString ? self as! NSMutableAttributedString : mutableCopy() as! NSMutableAttributedString
    }

    private func withNewAttribute(_ attributeName: String, value: Any) -> NSAttributedString {
        let newString = mutableString
        newString.addAttributes([attributeName: value], range: NSMakeRange(0, newString.length))
        return newString
    }

    /**
     Creates an attributed string with a specific font.

     - Parameter font: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withFont(_ font: UIFont) -> NSAttributedString {
        return withNewAttribute(NSFontAttributeName, value: font)
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - Parameter style: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withParagraphStyle(_ style: NSParagraphStyle) -> NSAttributedString {
        return withNewAttribute(NSParagraphStyleAttributeName, value: style)
    }

    /**
     Creates an attributed string with a specific text color.

     - Parameter color: The text color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextColor(_ color: UIColor) -> NSAttributedString {
        return withNewAttribute(NSForegroundColorAttributeName, value: color)
    }

    /**
     Creates an attributed string with a specific background color.

     - Parameter color: The background color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBackgroundColor(_ color: UIColor) -> NSAttributedString {
        return withNewAttribute(NSBackgroundColorAttributeName, value: color)
    }

    /**
     Creates an attributed string with a specific ligature.

     - Parameter ligatureValue: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLigature(_ ligatureValue: NSNumber) -> NSAttributedString {
        return withNewAttribute(NSLigatureAttributeName, value: ligatureValue)
    }

    /**
     Creates an attributed string with a specific kern.

     - Parameter kernValue: The kern value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withKern(_ kernValue: NSNumber) -> NSAttributedString {
        return withNewAttribute(NSKernAttributeName, value: kernValue)
    }

    /**
     Creates an attributed string with a specific strikethrough style.

     - Parameter style: The strikethrough style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughStyle(_ style: NSUnderlineStyle) -> NSAttributedString {
        return withNewAttribute(NSStrikethroughStyleAttributeName, value: NSNumber(value: style.rawValue))
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter style: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineStyle(_ style: NSUnderlineStyle) -> NSAttributedString {
        return withNewAttribute(NSUnderlineStyleAttributeName, value: NSNumber(value: style.rawValue))
    }

    /**
     Creates an attributed string with a specific stroke color.

     - Parameter color: The stroke color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeColor(_ color: UIColor) -> NSAttributedString {
        return withNewAttribute(NSStrokeColorAttributeName, value: color)
    }

    /**
     Creates an attributed string with a specific stroke width.

     - Parameter width The stroke width to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeWidth(_ width: NSNumber) -> NSAttributedString {
        return withNewAttribute(NSStrokeWidthAttributeName, value: width)
    }

    /**
     Creates an attributed string with a specific shadow.

     - Parameter shadow: The shadow to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withShadow(_ shadow: NSShadow) -> NSAttributedString {
        return withNewAttribute(NSShadowAttributeName, value: shadow)
    }

    /**
     Creates an attributed string with a specific text effect.

     - Parameter effect: The text effect to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextEffect(_ effect: String) -> NSAttributedString {
        return withNewAttribute(NSTextEffectAttributeName, value: effect)
    }

    /**
     Creates an attributed string with a specific attachment.

     - Parameter attachment: The attachment to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withAttachment(_ attachment: NSTextAttachment) -> NSAttributedString {
        return withNewAttribute(NSTextEffectAttributeName, value: attachment)
    }

    /**
     Creates an attributed string with a specific link.

     - Parameter link: The URL link to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLink(_ link: URL) -> NSAttributedString {
        return withNewAttribute(NSLinkAttributeName, value: link)
    }

    /**
     Creates an attributed string with a specific baseline offset.

     - Parameter offset: The baseline offset to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBaselineOffset(_ offset: Double) -> NSAttributedString {
        return withNewAttribute(NSBaselineOffsetAttributeName, value: NSNumber(value: offset))
    }

    /**
     Creates an attributed string with a specific underline color.

     - Parameter color: The underline color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineColor(_ color: UIColor) -> NSAttributedString {
        return withNewAttribute(NSUnderlineColorAttributeName, value: color)
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter color: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughColor(_ color: UIColor) -> NSAttributedString {
        return withNewAttribute(NSStrikethroughColorAttributeName, value: color)
    }

    /**
     Creates an attributed string with a specific obliqueness.

     - Parameter obliquenessValue: The obliqueness value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withObliqueness(_ obliquenessValue: Double) -> NSAttributedString {
        return withNewAttribute(NSObliquenessAttributeName, value: NSNumber(value: obliquenessValue))
    }

    /**
     Creates an attributed string with a specific expansion.

     - Parameter expansion: The expansion value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withExpansion(_ expansion: Double) -> NSAttributedString {
        return withNewAttribute(NSExpansionAttributeName, value: NSNumber(value: expansion))
    }

    /**
     Creates an attributed string with a specific writing direction.

     - Parameter directions: The direction(s) to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withWritingDirections(_ directions: [WritingDirection]) -> NSAttributedString {
        return withNewAttribute(NSWritingDirectionAttributeName, value: directions.map { NSNumber(value: $0.rawValue) })
    }
}

public extension String {

    fileprivate var attributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }

    /**
     Creates an attributed string with a specific font.
     
     - Parameter font: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withFont(_ font: UIFont) -> NSAttributedString {
        return attributedString.withFont(font)
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - Parameter style: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withParagraphStyle(_ style: NSParagraphStyle) -> NSAttributedString {
        return attributedString.withParagraphStyle(style)
    }

    /**
     Creates an attributed string with a specific text color.

     - Parameter color: The text color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextColor(_ color: UIColor) -> NSAttributedString {
        return attributedString.withTextColor(color)
    }

    /**
     Creates an attributed string with a specific background color.

     - Parameter color: The background color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBackgroundColor(_ color: UIColor) -> NSAttributedString {
        return attributedString.withBackgroundColor(color)
    }

    /**
     Creates an attributed string with a specific ligature.

     - Parameter ligatureValue: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLigature(_ ligatureValue: NSNumber) -> NSAttributedString {
        return attributedString.withLigature(ligatureValue)
    }

    /**
     Creates an attributed string with a specific kern.

     - Parameter kernValue: The kern value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withKern(_ kernValue: NSNumber) -> NSAttributedString {
        return attributedString.withKern(kernValue)
    }

    /**
     Creates an attributed string with a specific strikethrough style.

     - Parameter style: The strikethrough style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughStyle(_ style: NSUnderlineStyle) -> NSAttributedString {
        return attributedString.withStrikethroughStyle(style)
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter style: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineStyle(_ style: NSUnderlineStyle) -> NSAttributedString {
        return attributedString.withUnderlineStyle(style)
    }

    /**
     Creates an attributed string with a specific stroke color.

     - Parameter color: The stroke color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeColor(_ color: UIColor) -> NSAttributedString {
        return attributedString.withStrokeColor(color)
    }

    /**
     Creates an attributed string with a specific stroke width.

     - Parameter width The stroke width to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeWidth(_ width: NSNumber) -> NSAttributedString {
        return attributedString.withStrokeWidth(width)
    }

    /**
     Creates an attributed string with a specific shadow.

     - Parameter shadow: The shadow to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withShadow(_ shadow: NSShadow) -> NSAttributedString {
        return attributedString.withShadow(shadow)
    }

    /**
     Creates an attributed string with a specific text effect.

     - Parameter effect: The text effect to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextEffect(_ effect: String) -> NSAttributedString {
        return attributedString.withTextEffect(effect)
    }

    /**
     Creates an attributed string with a specific attachment.

     - Parameter attachment: The attachment to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withAttachment(_ attachment: NSTextAttachment) -> NSAttributedString {
        return attributedString.withAttachment(attachment)
    }

    /**
     Creates an attributed string with a specific link.

     - Parameter link: The URL link to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLink(_ link: URL) -> NSAttributedString {
        return attributedString.withLink(link)
    }

    /**
     Creates an attributed string with a specific baseline offset.

     - Parameter offset: The baseline offset to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBaselineOffset(_ offset: Double) -> NSAttributedString {
        return attributedString.withBaselineOffset(offset)
    }

    /**
     Creates an attributed string with a specific underline color.

     - Parameter color: The underline color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineColor(_ color: UIColor) -> NSAttributedString {
        return attributedString.withUnderlineColor(color)
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter color: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughColor(_ color: UIColor) -> NSAttributedString {
        return attributedString.withStrikethroughColor(color)
    }

    /**
     Creates an attributed string with a specific obliqueness.

     - Parameter obliquenessValue: The obliqueness value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withObliqueness(_ obliquenessValue: Double) -> NSAttributedString {
        return attributedString.withObliqueness(obliquenessValue)
    }

    /**
     Creates an attributed string with a specific expansion.

     - Parameter expansion: The expansion value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
     */
    public func withExpansion(_ expansion: Double) -> NSAttributedString {
        return attributedString.withExpansion(expansion)
    }

    /**
     Creates an attributed string with a specific writing direction.

     - Parameter directions: The direction(s) to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withWritingDirections(_ directions: [WritingDirection]) -> NSAttributedString {
        return attributedString.withWritingDirections(directions)
    }
}

/** 
 Overloaded addition operator for attributed strings. Creates a concatenated NSAttributedString.
*/
public func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    let combinedString = lhs.mutableString
    combinedString.append(rhs)
    return combinedString
}
