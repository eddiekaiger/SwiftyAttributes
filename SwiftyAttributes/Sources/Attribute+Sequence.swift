//
//  AttributeConversions.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/23/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

/**
 An extension on dictionaries that allows us to convert a Foundation-based dictionary of attributes to an array of `Attribute`s.

 A Sequence with an iterator of (String, Any) is equivalent to [String: Any]
 This is a simple syntactic workaround since we can't write "extension Dictionary where Key == String". Thanks Swift :)
 */
extension Sequence where Iterator.Element == (key: String, value: Any) {

    /// Returns an array of `Attribute`s converted from the dictionary of attributes. Use this whenever you want to convert [String: Any] to [Attribute].
    public var swiftyAttributes: [Attribute] {
        return flatMap { name, value in
            if let attrName = Attribute.Name(rawValue: name) {
                return Attribute(name: attrName, foundationValue: value)
            } else {
                return nil
            }
        }
    }

}

extension Sequence where Iterator.Element == Attribute {

    /// Returns the attribute dictionary required by Foundation's API for attributed strings. Use this whenever you need to convert [Attribute] to [String: Any].
    public var foundationAttributes: [String: Any] {
        return reduce([String: Any]()) { dictionary, attribute in
            var dict = dictionary
            dict[attribute.keyName] = attribute.foundationValue
            return dict
        }
    }

}
