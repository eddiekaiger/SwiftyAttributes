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

    /**
     Returns an `NSAttributedString` object consisting of the characters and attributes within a given range in the receiver.
     
     - parameter    range:  The range from which to create a new attributed string. `range` must lie within the bounds of the receiver.
     - returns:             An `NSAttributedString` object consisting of the characters and attributes within `range` in the receiver.
     */
    public func attributedSubstring(from range: Range<Int>) -> NSAttributedString {
        return attributedSubstring(from: NSRange(range))
    }

    /**
     Returns the value for an attribute with a given name of the character at a given index, and by reference the range over which the attribute applies.
     
     - parameters:
        - attrName:   The name of an attribute.
        - location:   The index for which to return attributes. This value must not exceed the bounds of the receiver.
        - range: 
            If non-nil:
            - If the named attribute exists at `location`, upon return `range` contains a range over which the named attribute’s value applies.
            - If the named attribute does not exist at `location`, upon return `range` contains the range over which the attribute does not exist.
            
            The range isn’t necessarily the maximum range covered by `attrName`, and its extent is implementation-dependent. 
            If you need the maximum range, use attribute(_:at:longestEffectiveRange:in:). If you don't need this value, pass `nil`.
     */
    public func attribute(_ attrName: Attribute.Name, at location: Int, effectiveRange range: NSRangePointer? = nil) -> Attribute? {
        if let attributeValue = attribute(attrName.rawValue, at: location, effectiveRange: range) {
            return Attribute(name: attrName, foundationValue: attributeValue)
        }
        return nil
    }

    /**
     Returns the enumerated attributes in a specified range as an array of attribute-range pairs.
     
     - parameters:
        - range:    Contains the maximum range over which the attributes are enumerated.
        - options:  The options used by the enumeration. The values can be combined using C-bitwise OR. The values are described in `NSAttributedString.EnumerationOptions`.
     - returns:     An array of attribute-range tuples. Each tuples contains a range and the array of attributes that exist in that range.
     */
    public func attributes(in range: Range<Int>, options: NSAttributedString.EnumerationOptions = []) -> [([Attribute], Range<Int>)] {
        var attributeRanges = [([Attribute], Range<Int>)]()
        enumerateAttributes(in: range, options: options) { attributes, range, _ in
            attributeRanges.append((attributes, range))
        }
        return attributeRanges
    }

    /**
     Executes the block for each attribute in the range. For discussion, see documentation for `NSAttributedString.enumerateAttributes(in:options:using:)`.
     
     - parameters:

        - enumerationRange: Contains the maximum range over which the attributes and values are enumerated, clipped to enumerationRange.
        - options:          The options used by the enumeration. The values can be combined using C-bitwise OR. The values are described in `NSAttributedString.EnumerationOptions`.
        - block:            The block to apply to ranges of the attribute in the attributed string. The block takes three arguments:

        + attrs:    The attributes for the range.
        + range:    The run of the attributes.
        + stop:     A reference to a Boolean value. The block can set the value to `true` to stop further processing of the set. 
                    The stop argument is an out-only argument. You should only ever set this Boolean to `true` within the block.
     */
    public func enumerateAttributes(in enumerationRange: Range<Int>, options: NSAttributedString.EnumerationOptions = [], using block: (_ attrs: [Attribute], _ range: Range<Int>, _ stop: UnsafeMutablePointer<ObjCBool>) -> Void) {
        enumerateAttributes(in: NSRange(enumerationRange), options: options) { attributes, range, ptr in
            block(attributes.swiftyAttributes, range.location ..< (range.location + range.length), ptr)
        }
    }

    /**
     Executes the block for the specified attribute run in the specified range. For discussion, see documentation for `NSAttributedString.enumerateAttribute(_:in:options:using:)`.
     
     - parameters:
        
        - attrName:         The name of an attribute.
        - enumerationRange: Contains the maximum range over which the attributes and values are enumerated, clipped to enumerationRange.
        - options:          The options used by the enumeration. The values can be combined using C-bitwise OR. The values are described in `NSAttributedString.EnumerationOptions`.
        - block:            The block to apply to ranges of the attribute in the attributed string. The block takes three arguments:

         + value:   The value of the attribute.
         + range:   A range containing the run of the attribute.
         + stop:    A reference to a Boolean value. The block can set the value to `true` to stop further processing of the set.
                    The stop argument is an out-only argument. You should only ever set this Boolean to `true` within the block.
     */
    public func enumerateAttribute(_ attrName: Attribute.Name, in enumerationRange: Range<Int>, options: NSAttributedString.EnumerationOptions = [], using block: (_ value: Any?, _ range: Range<Int>, _ stop: UnsafeMutablePointer<ObjCBool>) -> Void) {
        enumerateAttribute(attrName.rawValue, in: NSRange(enumerationRange), options: options) { value, range, ptr in
            block(value, range.location ..< (range.location + range.length), ptr)
        }
    }

}

extension NSAttributedString {

    /**
     Creates an attributed string with a specific font.

     - parameter    font:   The font to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withFont(_ font: Font) -> NSMutableAttributedString {
        return withAttribute(.font(font))
    }

    /**
     Creates an attributed string with a specific paragraph style.

     - parameter    style:  The font to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withParagraphStyle(_ style: ParagraphStyle) -> NSMutableAttributedString {
        return withAttribute(.paragraphStyle(style))
    }

    /**
     Creates an attributed string with a specific text color.

     - parameter    color:  The text color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withTextColor(_ color: Color) -> NSMutableAttributedString {
        return withAttribute(.textColor(color))
    }

    /**
     Creates an attributed string with a specific background color.

     - parameter    color:  The background color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withBackgroundColor(_ color: Color) -> NSMutableAttributedString {
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
    public func withStrikethroughStyle(_ style: UnderlineStyle) -> NSMutableAttributedString {
        return withAttribute(.strikethroughStyle(style))
    }

    /**
     Creates an attributed string with a specific underline style.

     - parameter    style:  The underline style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withUnderlineStyle(_ style: UnderlineStyle) -> NSMutableAttributedString {
        return withAttribute(.underlineStyle(style))
    }

    /**
     Creates an attributed string with a specific stroke color.

     - parameter    color:  The stroke color to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrokeColor(_ color: Color) -> NSMutableAttributedString {
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

    #if os(watchOS)
    #else
    /**
     Creates an attributed string with a specific shadow.

     - parameter    shadow:     The shadow to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withShadow(_ shadow: Shadow) -> NSMutableAttributedString {
        return withAttribute(.shadow(shadow))
    }
    #endif

    /**
     Creates an attributed string with a specific text effect.

     - parameter    effect:     The text effect to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withTextEffect(_ effect: TextEffect) -> NSMutableAttributedString {
        return withAttribute(.textEffect(effect))
    }

    #if os(watchOS)
    #else
    /**
     Creates an attributed string with a specific attachment.

     - parameter    attachment: The attachment to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withAttachment(_ attachment: TextAttachment) -> NSMutableAttributedString {
        return withAttribute(.attachment(attachment))
    }
    #endif

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
    public func withUnderlineColor(_ color: Color) -> NSMutableAttributedString {
        return withAttribute(.underlineColor(color))
    }

    /**
     Creates an attributed string with a specific underline style.

     - parameter    color:  The underline style to set for the attributed string.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withStrikethroughColor(_ color: Color) -> NSMutableAttributedString {
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
     Creates an attributed string with a specific vertical glyph form (horizontal or vertical writing direction).

     - parameter    form:   The horizontal/vertical writing direction to set for the attributed string. See `VerticalGlyphForm` for details.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withVerticalGlyphForm(_ form: VerticalGlyphForm) -> NSMutableAttributedString {
        return withAttribute(.verticalGlyphForm(form))
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
