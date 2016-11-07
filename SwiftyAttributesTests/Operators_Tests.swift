//
//  Operators_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class Operators_Tests: XCTestCase {
    
    func testOverloadedAdditionOperator() {
        let lhs = "Hello".withFont(.systemFont(ofSize: 19))
        let rhs = "World".withTextColor(.magenta).withBackgroundColor(.orange).withFont(.boldSystemFont(ofSize: 24))
        let newString = lhs + rhs
        let leftAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 19)] as [String: NSObject]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as! [String: NSObject], leftAttributes)
        let rightAttributes = [NSForegroundColorAttributeName: UIColor.magenta,
                               NSBackgroundColorAttributeName: UIColor.orange,
                               NSFontAttributeName: UIFont.boldSystemFont(ofSize: 24)] as [String: NSObject]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as! [String: NSObject], rightAttributes)
    }

}
