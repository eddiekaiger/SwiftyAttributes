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
        addAttributes(attributes, range: NSRange(location: range.lowerBound, length: range.count))
    }

    public func addAttributes(_ attributes: [Attribute], range: NSRange) {
        addAttributes(dictionary(from: attributes), range: range)
    }
}
