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

/**
 Addition and assign operator. Creates a concatenated string and assigns it to the left value.
 */
public func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
    lhs = lhs + rhs
}

public func += (lhs: inout NSMutableAttributedString, rhs: NSAttributedString) {
    lhs = lhs + rhs
}

public func += (lhs: inout NSAttributedString, rhs: NSMutableAttributedString) {
    lhs = lhs + rhs
}

public func += (lhs: inout NSMutableAttributedString, rhs: NSMutableAttributedString) {
    lhs = lhs + rhs
}
