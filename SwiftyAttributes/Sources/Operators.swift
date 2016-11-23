//
//  Operators.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

/**
 Overloaded addition operator for attributed strings. Creates a concatenated NSAttributedString.
 */
public func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
    let combinedString = lhs.mutableCopy() as! NSMutableAttributedString
    combinedString.append(rhs)
    return combinedString
}
