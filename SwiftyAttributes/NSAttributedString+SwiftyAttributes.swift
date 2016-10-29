//
//  NSAttributedString+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

func dictionary(from attributes: [Attribute]) -> [String: Any] {
    var dict = [String: Any]()
    for attr in attributes {
        dict[attr.keyName] = attr.foundationValue
    }
    return dict
}

extension NSAttributedString {

    /**
     Creates a new `NSAttributedString` with the specified attributes.
     
     - parameter    str:            The string for the new attributed string.
     - parameter    attributes:     The attributes for the new attributed string.
     */
    public convenience init(string str: String, attributes: [Attribute]) {
        self.init(string: str, attributes: dictionary(from: attributes))
    }

    /**
     Returns an attributed string with the specified attributes added.

     - parameter    attributes:     The attributes to add to the new attributed string.
     - returns:                     An `NSMutableAttributedString` with the new attributes applied.
     */
    public func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString {
        let mutable = mutableCopy() as! NSMutableAttributedString
        mutable.addAttributes(dictionary(from: attributes), range: NSRange(location: 0, length: length))
        return mutable
    }

    /**
     Returns an attributed string with the specified attribute added.
     
     - parameter    attribute:  The attribute to add to the new attributed string.
     - returns:                 An `NSMutableAttributedString` with the new attribute applied.
     */
    public func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString {
        return withAttributes([attribute])
    }

    public func attributedSubstring(from range: Range<Int>) -> NSAttributedString {
        return attributedSubstring(from: NSRange(range))
    }

    public func attribute(_ attrName: Attribute.Name, at location: Int, effectiveRange range: NSRangePointer? = nil) -> Attribute? {
        if let attr = attribute(attrName.rawValue, at: location, effectiveRange: range) {
            let attributeValue: Any
            switch attrName {
            case .ligature: attributeValue = Ligatures(rawValue: attr as! Int)!
            case .strikethroughStyle: attributeValue = NSUnderlineStyle(rawValue: attr as! Int)!
            case .textEffect: attributeValue = TextEffect(rawValue: attr as! String)!
            case .underlineStyle: attributeValue = NSUnderlineStyle(rawValue: attr as! Int)!
            case .writingDirection: attributeValue = (attr as! [Int]).map(WritingDirection.init)
            default: attributeValue = attr
            }
            return Attribute(name: attrName, value: attributeValue)
        }
        return nil
    }

}

extension NSAttributedString {

    /**
     Creates an attributed string with a specific font.

     - parameter    font:   The font to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withFont(_ font: UIFont) -> NSMutableAttributedString {
        return withAttribute(.font(font))
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - parameter    style:  The font to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withParagraphStyle(_ style: NSParagraphStyle) -> NSMutableAttributedString {
        return withAttribute(.paragraphStyle(style))
    }

    /**
     Creates an attributed string with a specific text color.

     - parameter    color:  The text color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withTextColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.textColor(color))
    }

    /**
     Creates an attributed string with a specific background color.

     - parameter    color:  The background color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withBackgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.backgroundColor(color))
    }

    /**
     Creates an attributed string with a specific ligature.

     - parameter    ligatures:  The font to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withLigatures(_ ligatures: Ligatures) -> NSMutableAttributedString {
        return withAttribute(.ligatures(ligatures))
    }

    /**
     Creates an attributed string with a specific kern.

     - parameter    kernValue:  The kern value to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withKern(_ kernValue: Double) -> NSMutableAttributedString {
        return withAttribute(.kern(kernValue))
    }

    /**
     Creates an attributed string with a specific strikethrough style.

     - parameter    style:  The strikethrough style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrikethroughStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return withAttribute(.strikethroughStyle(style))
    }

    /**
     Creates an attributed string with a specific underline style.

     - parameter    style:  The underline style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withUnderlineStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return withAttribute(.underlineStyle(style))
    }

    /**
     Creates an attributed string with a specific stroke color.

     - parameter    color:  The stroke color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrokeColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.strokeColor(color))
    }

    /**
     Creates an attributed string with a specific stroke width.

     - parameter    width:  The stroke width to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrokeWidth(_ width: Double) -> NSMutableAttributedString {
        return withAttribute(.strokeWidth(width))
    }

    /**
     Creates an attributed string with a specific shadow.

     - parameter    shadow:     The shadow to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withShadow(_ shadow: NSShadow) -> NSMutableAttributedString {
        return withAttribute(.shadow(shadow))
    }

    /**
     Creates an attributed string with a specific text effect.

     - parameter    effect:     The text effect to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withTextEffect(_ effect: TextEffect) -> NSMutableAttributedString {
        return withAttribute(.textEffect(effect))
    }

    /**
     Creates an attributed string with a specific attachment.

     - parameter    attachment: The attachment to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withAttachment(_ attachment: NSTextAttachment) -> NSMutableAttributedString {
        return withAttribute(.attachment(attachment))
    }

    /**
     Creates an attributed string with a specific link.

     - parameter    link:   The URL link to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withLink(_ link: URL) -> NSMutableAttributedString {
        return withAttribute(.link(link))
    }

    /**
     Creates an attributed string with a specific baseline offset.

     - parameter    offset:     The baseline offset to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withBaselineOffset(_ offset: Double) -> NSMutableAttributedString {
        return withAttribute(.baselineOffset(offset))
    }

    /**
     Creates an attributed string with a specific underline color.

     - parameter    color:  The underline color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withUnderlineColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.underlineColor(color))
    }

    /**
     Creates an attributed string with a specific underline style.

     - parameter    color:  The underline style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrikethroughColor(_ color: UIColor) -> NSMutableAttributedString {
        return withAttribute(.strikethroughColor(color))
    }

    /**
     Creates an attributed string with a specific obliqueness.

     - parameter    obliquenessValue:   The obliqueness value to set for the attributed string.
     - returns:                         A new attributed string with the newly added attribute.
     */
    public func withObliqueness(_ obliquenessValue: Double) -> NSMutableAttributedString {
        return withAttribute(.obliqueness(obliquenessValue))
    }

    /**
     Creates an attributed string with a specific expansion.

     - parameter    expansion:  The expansion value to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withExpansion(_ expansion: Double) -> NSMutableAttributedString {
        return withAttribute(.expansion(expansion))
    }

    /**
     Creates an attributed string with a specific writing direction.

     - parameter    directions:     The direction(s) to set for the attributed string.
     - returns:                     A new attributed string with the newly added attribute.
     */
    public func withWritingDirections(_ directions: [WritingDirection]) -> NSMutableAttributedString {
        return withAttribute(.writingDirections(directions))
    }
}
