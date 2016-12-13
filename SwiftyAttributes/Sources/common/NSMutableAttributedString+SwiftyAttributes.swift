//
//  NSMutableAttributedString+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {

    /**
     Adds the given collection of attributes to the characters in the specified range.
     
     - parameter    attributes:     The attributes to add.
     - parameter    range:          The range of characters to which the specified attributes apply.
     */
    public func addAttributes(_ attributes: [Attribute], range: Range<Int>) {
        addAttributes(attributes, range: NSRange(range))
    }

    /**
     Adds the given collection of attributes to the characters in the specified range.

     - parameter    attributes:     The attributes to add.
     - parameter    range:          The range of characters to which the specified attributes apply.
     */
    public func addAttributes(_ attributes: [Attribute], range: NSRange) {
        addAttributes(dictionary(from: attributes), range: range)
    }

    /**
     Sets the attributes for the characters in the specified range to the specified attributes.

     - parameter    attributes:     The attributes to set.
     - parameter    range:          The range of characters whose attributes are set.
     */
    public func setAttributes(_ attributes: [Attribute], range: Range<Int>) {
        setAttributes(attributes, range: NSRange(range))
    }

    /**
     Sets the attributes for the characters in the specified range to the specified attributes.

     - parameter    attributes:     The attributes to set.
     - parameter    range:          The range of characters whose attributes are set.
     */
    public func setAttributes(_ attributes: [Attribute], range: NSRange) {
        setAttributes(dictionary(from: attributes), range: range)
    }

    /**
     Replaces the characters in the given range with the characters of the given string.
     
     - parameter    range:  A range specifying the characters to replace.
     - parameter    str:    A string specifying the characters to replace those in `range`.
     */
    public func replaceCharacters(in range: Range<Int>, with str: String) {
        replaceCharacters(in: NSRange(range), with: str)
    }

    /**
     Replaces the characters and attributes in a given range with the characters and attributes of the given attributed string.
     
     - parameter    range:          The range of characters and attributes replaced.
     - parameter    attrString:     The attributed string whose characters and attributes replace those in the specified range.
     */
    public func replaceCharacters(in range: Range<Int>, with attrString: NSAttributedString) {
        replaceCharacters(in: NSRange(range), with: attrString)
    }

    /**
     Deletes the characters in the given range along with their associated attributes.
     
     - parameter    range:  A range specifying the characters to delete.
     */
    public func deleteCharacters(in range: Range<Int>) {
        deleteCharacters(in: NSRange(range))
    }

    /**
     Removes the named attribute from the characters in the specified range.
     
     - parameter    name:   The name of the attribute to remove.
     - parameter    range:  The range of characters from which the specified attribute is removed.
     */
    public func removeAttribute(_ name: Attribute.Name, range: Range<Int>) {
        removeAttribute(name.rawValue, range: NSRange(range))
    }
    
}
