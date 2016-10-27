//
//  NSMutableAttributedString+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {

    public func addAttributes(_ attributes: [Attribute], range: Range<Int>) {
        addAttributes(attributes, range: NSRange(range))
    }

    public func addAttributes(_ attributes: [Attribute], range: NSRange) {
        addAttributes(dictionary(from: attributes), range: range)
    }

    public func setAttributes(_ attributes: [Attribute], range: Range<Int>) {
        setAttributes(attributes, range: NSRange(range))
    }

    public func setAttributes(_ attributes: [Attribute], range: NSRange) {
        setAttributes(dictionary(from: attributes), range: range)
    }

    public func replaceCharacters(in range: Range<Int>, with str: String) {
        replaceCharacters(in: NSRange(range), with: str)
    }

    public func replaceCharacters(in range: Range<Int>, with attrString: NSAttributedString) {
        replaceCharacters(in: NSRange(range), with: attrString)
    }

    public func deleteCharacters(in range: Range<Int>) {
        deleteCharacters(in: NSRange(range))
    }

    public func removeAttribute(_ name: Attribute.Name, range: Range<Int>) {
        removeAttribute(name.rawValue, range: NSRange(range))
    }
    
}
