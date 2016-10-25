
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

    /**
     Creates an attributed string with a specific font.

     - Parameter font: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withFont(_ font: UIFont) -> NSMutableAttributedString {
        return withAttribute(.font(font))
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - Parameter style: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withParagraphStyle(_ style: NSParagraphStyle) -> NSMutableAttributedString {
        return withAttribute(.paragraphStyle(style))
    }

    /**
     Creates an attributed string with a specific text color.

     - Parameter color: The text color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.textColor(color))
    }

    /**
     Creates an attributed string with a specific background color.

     - Parameter color: The background color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBackgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.backgroundColor(color))
    }

    /**
     Creates an attributed string with a specific ligature.

     - Parameter ligatureValue: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLigatures(_ ligatures: Ligatures) -> NSMutableAttributedString {
        return withAttribute(.ligatures(ligatures))
    }

    /**
     Creates an attributed string with a specific kern.

     - Parameter kernValue: The kern value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withKern(_ kernValue: Double) -> NSMutableAttributedString {
        return withAttribute(.kern(kernValue))
    }

    /**
     Creates an attributed string with a specific strikethrough style.

     - Parameter style: The strikethrough style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return withAttribute(.strikethroughStyle(style))
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter style: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return withAttribute(.underlineStyle(style))
    }

    /**
     Creates an attributed string with a specific stroke color.

     - Parameter color: The stroke color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.strokeColor(color))
    }

    /**
     Creates an attributed string with a specific stroke width.

     - Parameter width The stroke width to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeWidth(_ width: Double) -> NSMutableAttributedString {
        return withAttribute(.strokeWidth(width))
    }

    /**
     Creates an attributed string with a specific shadow.

     - Parameter shadow: The shadow to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withShadow(_ shadow: NSShadow) -> NSMutableAttributedString {
        return withAttribute(.shadow(shadow))
    }

    /**
     Creates an attributed string with a specific text effect.

     - Parameter effect: The text effect to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextEffect(_ effect: String) -> NSMutableAttributedString {
        return withAttribute(.textEffect(effect))
    }

    /**
     Creates an attributed string with a specific attachment.

     - Parameter attachment: The attachment to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withAttachment(_ attachment: NSTextAttachment) -> NSMutableAttributedString {
        return withAttribute(.attachment(attachment))
    }

    /**
     Creates an attributed string with a specific link.

     - Parameter link: The URL link to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLink(_ link: URL) -> NSMutableAttributedString {
        return withAttribute(.link(link))
    }

    /**
     Creates an attributed string with a specific baseline offset.

     - Parameter offset: The baseline offset to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBaselineOffset(_ offset: Double) -> NSMutableAttributedString {
        return withAttribute(.baselineOffset(offset))
    }

    /**
     Creates an attributed string with a specific underline color.

     - Parameter color: The underline color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.underlineColor(color))
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter color: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.strikethroughColor(color))
    }

    /**
     Creates an attributed string with a specific obliqueness.

     - Parameter obliquenessValue: The obliqueness value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withObliqueness(_ obliquenessValue: Double) -> NSMutableAttributedString {
        return withAttribute(.obliqueness(obliquenessValue))
    }

    /**
     Creates an attributed string with a specific expansion.

     - Parameter expansion: The expansion value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withExpansion(_ expansion: Double) -> NSMutableAttributedString {
        return withAttribute(.expansion(expansion))
    }

    /**
     Creates an attributed string with a specific writing direction.

     - Parameter directions: The direction(s) to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withWritingDirections(_ directions: [WritingDirection]) -> NSMutableAttributedString {
        return withAttribute(.writingDirections(directions))
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
    public func withFont(_ font: UIFont) -> NSMutableAttributedString {
        return attributedString.withFont(font)
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - Parameter style: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withParagraphStyle(_ style: NSParagraphStyle) -> NSMutableAttributedString {
        return attributedString.withParagraphStyle(style)
    }

    /**
     Creates an attributed string with a specific text color.

     - Parameter color: The text color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withTextColor(color)
    }

    /**
     Creates an attributed string with a specific background color.

     - Parameter color: The background color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBackgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withBackgroundColor(color)
    }

    /**
     Creates an attributed string with a specific ligature.

     - Parameter ligatureValue: The font to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLigatures(_ ligatures: Ligatures) -> NSMutableAttributedString {
        return attributedString.withLigatures(ligatures)
    }

    /**
     Creates an attributed string with a specific kern.

     - Parameter kernValue: The kern value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withKern(_ kernValue: Double) -> NSMutableAttributedString {
        return attributedString.withKern(kernValue)
    }

    /**
     Creates an attributed string with a specific strikethrough style.

     - Parameter style: The strikethrough style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return attributedString.withStrikethroughStyle(style)
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter style: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return attributedString.withUnderlineStyle(style)
    }

    /**
     Creates an attributed string with a specific stroke color.

     - Parameter color: The stroke color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withStrokeColor(color)
    }

    /**
     Creates an attributed string with a specific stroke width.

     - Parameter width The stroke width to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrokeWidth(_ width: Double) -> NSMutableAttributedString {
        return attributedString.withStrokeWidth(width)
    }

    /**
     Creates an attributed string with a specific shadow.

     - Parameter shadow: The shadow to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withShadow(_ shadow: NSShadow) -> NSMutableAttributedString {
        return attributedString.withShadow(shadow)
    }

    /**
     Creates an attributed string with a specific text effect.

     - Parameter effect: The text effect to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withTextEffect(_ effect: String) -> NSMutableAttributedString {
        return attributedString.withTextEffect(effect)
    }

    /**
     Creates an attributed string with a specific attachment.

     - Parameter attachment: The attachment to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withAttachment(_ attachment: NSTextAttachment) -> NSMutableAttributedString {
        return attributedString.withAttachment(attachment)
    }

    /**
     Creates an attributed string with a specific link.

     - Parameter link: The URL link to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withLink(_ link: URL) -> NSMutableAttributedString {
        return attributedString.withLink(link)
    }

    /**
     Creates an attributed string with a specific baseline offset.

     - Parameter offset: The baseline offset to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withBaselineOffset(_ offset: Double) -> NSMutableAttributedString {
        return attributedString.withBaselineOffset(offset)
    }

    /**
     Creates an attributed string with a specific underline color.

     - Parameter color: The underline color to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withUnderlineColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withUnderlineColor(color)
    }

    /**
     Creates an attributed string with a specific underline style.

     - Parameter color: The underline style to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withStrikethroughColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withStrikethroughColor(color)
    }

    /**
     Creates an attributed string with a specific obliqueness.

     - Parameter obliquenessValue: The obliqueness value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withObliqueness(_ obliquenessValue: Double) -> NSMutableAttributedString {
        return attributedString.withObliqueness(obliquenessValue)
    }

    /**
     Creates an attributed string with a specific expansion.

     - Parameter expansion: The expansion value to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
     */
    public func withExpansion(_ expansion: Double) -> NSMutableAttributedString {
        return attributedString.withExpansion(expansion)
    }

    /**
     Creates an attributed string with a specific writing direction.

     - Parameter directions: The direction(s) to set for the attributed string.
     - Returns: A new attributed string with the newly added attribute.
    */
    public func withWritingDirections(_ directions: [WritingDirection]) -> NSMutableAttributedString {
        return attributedString.withWritingDirections(directions)
    }
}

/** 
 Overloaded addition operator for attributed strings. Creates a concatenated NSAttributedString.
*/
public func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
    let combinedString = lhs.mutableCopy() as! NSMutableAttributedString
    combinedString.append(rhs)
    return combinedString
}
