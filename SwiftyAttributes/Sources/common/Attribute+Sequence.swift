//
//  AttributeConversions.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/23/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

/**
 An extension on dictionaries that allows us to convert a Foundation-based dictionary of attributes to an array of `Attribute`s.
 */

extension Dictionary where Key == NSAttributedString.Key {

    /// Returns an array of `Attribute`s converted from the dictionary of attributes. Use this whenever you want to convert [NSAttributeStringKey: Any] to [Attribute].
    public var swiftyAttributes: [Attribute] {
        return map(Attribute.init)
    }

}

extension Sequence where Iterator.Element == Attribute {

    /// Returns the attribute dictionary required by Foundation's API for attributed strings. Use this whenever you need to convert [Attribute] to [String: Any].
    public var foundationAttributes: [NSAttributedString.Key: Any] {
        return reduce([NSAttributedString.Key: Any]()) { dictionary, attribute in
            var dict = dictionary
            dict[attribute.keyName] = attribute.foundationValue
            return dict
        }
    }

}
