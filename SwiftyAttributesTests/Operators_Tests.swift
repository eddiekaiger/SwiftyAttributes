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
        let leftAttributes: [NSAttributedString.Key: NSObject] = [.font: Font.systemFont(ofSize: 19)]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as NSDictionary, leftAttributes as NSDictionary)
        let rightAttributes: [NSAttributedString.Key: NSObject] = [
            .foregroundColor: Color.magenta,
            .backgroundColor: Color.orange,
            .font: Font.boldSystemFont(ofSize: 24)
        ]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as NSDictionary, rightAttributes as NSDictionary)
    }
    
    func testOverloadedAssignedAdditionOperator() {
        let lhs = "Hello".withFont(.systemFont(ofSize: 19))
        let rhs = "World".withTextColor(.magenta).withBackgroundColor(.orange).withFont(.boldSystemFont(ofSize: 24))
        var newString = lhs
        newString += rhs
        #if swift(>=4.0)
        let leftAttributes: [AttributeName: NSObject] = [.font: Font.systemFont(ofSize: 19)]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as NSDictionary, leftAttributes as NSDictionary)
        let rightAttributes: [AttributeName: NSObject] = [
            .foregroundColor: Color.magenta,
            .backgroundColor: Color.orange,
            .font: Font.boldSystemFont(ofSize: 24)
        ]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as NSDictionary, rightAttributes as NSDictionary)
        #else
        let leftAttributes = [NSFontAttributeName: Font.systemFont(ofSize: 19)] as [String: NSObject]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as! [String: NSObject], leftAttributes)
        let rightAttributes = [NSForegroundColorAttributeName: Color.magenta,
        NSBackgroundColorAttributeName: Color.orange,
        NSFontAttributeName: Font.boldSystemFont(ofSize: 24)] as [String: NSObject]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as! [String: NSObject], rightAttributes)
        #endif
    }

}
