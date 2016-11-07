//
//  String+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

extension String {

    /**
     Returns an attributed string with the specified attributes added.

     - parameter    attributes:     The attributes to add to the new attributed string.
     - returns:                     An `NSMutableAttributedString` with the new attributes applied.
     */
    public func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString {
        return attributedString.withAttributes(attributes)
    }

    /**
     Returns an attributed string with the specified attribute added.

     - parameter    attribute:  The attribute to add to the new attributed string.
     - returns:                 An `NSMutableAttributedString` with the new attribute applied.
     */
    public func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString {
        return attributedString.withAttribute(attribute)
    }

}

extension String {

    fileprivate var attributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }

    /**
     Creates an attributed string with a specific font.

     - parameter    font:   The font to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withFont(_ font: UIFont) -> NSMutableAttributedString {
        return attributedString.withFont(font)
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - parameter    style:  The font to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withParagraphStyle(_ style: NSParagraphStyle) -> NSMutableAttributedString {
        return attributedString.withParagraphStyle(style)
    }

    /**
     Creates an attributed string with a specific text color.

     - parameter    color:  The text color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withTextColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withTextColor(color)
    }

    /**
     Creates an attributed string with a specific background color.

     - parameter    color:  The background color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withBackgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withBackgroundColor(color)
    }

    /**
     Creates an attributed string with a specific ligature.

     - parameter    ligatures:  The font to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withLigatures(_ ligatures: Ligatures) -> NSMutableAttributedString {
        return attributedString.withLigatures(ligatures)
    }

    /**
     Creates an attributed string with a specific kern.

     - parameter    kernValue:  The kern value to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withKern(_ kernValue: Double) -> NSMutableAttributedString {
        return attributedString.withKern(kernValue)
    }

    /**
     Creates an attributed string with a specific strikethrough style.

     - parameter    style:  The strikethrough style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrikethroughStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return attributedString.withStrikethroughStyle(style)
    }

    /**
     Creates an attributed string with a specific underline style.

     - parameter    style:  The underline style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withUnderlineStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return attributedString.withUnderlineStyle(style)
    }

    /**
     Creates an attributed string with a specific stroke color.

     - parameter    color:  The stroke color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrokeColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withStrokeColor(color)
    }

    /**
     Creates an attributed string with a specific stroke width.

     - parameter    width:  The stroke width to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrokeWidth(_ width: Double) -> NSMutableAttributedString {
        return attributedString.withStrokeWidth(width)
    }

    /**
     Creates an attributed string with a specific shadow.

     - parameter    shadow:     The shadow to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withShadow(_ shadow: NSShadow) -> NSMutableAttributedString {
        return attributedString.withShadow(shadow)
    }

    /**
     Creates an attributed string with a specific text effect.

     - parameter    effect:     The text effect to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withTextEffect(_ effect: TextEffect) -> NSMutableAttributedString {
        return attributedString.withTextEffect(effect)
    }

    /**
     Creates an attributed string with a specific attachment.

     - parameter    attachment:     The attachment to set for the attributed string.
     - returns:                     A new attributed string with the newly added attribute.
     */
    public func withAttachment(_ attachment: NSTextAttachment) -> NSMutableAttributedString {
        return attributedString.withAttachment(attachment)
    }

    /**
     Creates an attributed string with a specific link.

     - parameter    link:   The URL link to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withLink(_ link: URL) -> NSMutableAttributedString {
        return attributedString.withLink(link)
    }

    /**
     Creates an attributed string with a specific baseline offset.

     - parameter 	offset:     The baseline offset to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withBaselineOffset(_ offset: Double) -> NSMutableAttributedString {
        return attributedString.withBaselineOffset(offset)
    }

    /**
     Creates an attributed string with a specific underline color.

     - parameter    color:  The underline color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withUnderlineColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withUnderlineColor(color)
    }

    /**
     Creates an attributed string with a specific underline style.

     - parameter    color:  The underline style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrikethroughColor(_ color: UIColor) -> NSMutableAttributedString {
        return attributedString.withStrikethroughColor(color)
    }

    /**
     Creates an attributed string with a specific obliqueness.

     - parameter    obliquenessValue:   The obliqueness value to set for the attributed string.
     - returns:                         A new attributed string with the newly added attribute.
     */
    public func withObliqueness(_ obliquenessValue: Double) -> NSMutableAttributedString {
        return attributedString.withObliqueness(obliquenessValue)
    }

    /**
     Creates an attributed string with a specific expansion.

     - parameter    expansion:  The expansion value to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withExpansion(_ expansion: Double) -> NSMutableAttributedString {
        return attributedString.withExpansion(expansion)
    }

    /**
     Creates an attributed string with a specific writing direction.

     - parameter    directions:     The direction(s) to set for the attributed string.
     - returns:                     A new attributed string with the newly added attribute.
     */
    public func withWritingDirections(_ directions: [WritingDirection]) -> NSMutableAttributedString {
        return attributedString.withWritingDirections(directions)
    }

}
