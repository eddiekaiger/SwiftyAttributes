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
    
    //  NSAttributedString + NSAttributedString
    func testOverloadedAssignedAdditionOperator1() {
        let lhs = "Hello".withFont(.systemFont(ofSize: 19)) as NSAttributedString
        let rhs = "World".withTextColor(.magenta).withBackgroundColor(.orange).withFont(.boldSystemFont(ofSize: 24)) as NSAttributedString
        var newString = lhs
        newString += rhs
        let leftAttributes: [NSAttributedString.Key: NSObject] = [.font: Font.systemFont(ofSize: 19)]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as NSDictionary, leftAttributes as NSDictionary)
        let rightAttributes: [NSAttributedString.Key: NSObject] = [
            .foregroundColor: Color.magenta,
            .backgroundColor: Color.orange,
            .font: Font.boldSystemFont(ofSize: 24)
        ]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as NSDictionary, rightAttributes as NSDictionary)
    }
    
    //  NSMutableAttributedString + NSAttributedString
    func testOverloadedAssignedAdditionOperator2() {
        let lhs = "Hello".withFont(.systemFont(ofSize: 19))
        let rhs = "World".withTextColor(.magenta).withBackgroundColor(.orange).withFont(.boldSystemFont(ofSize: 24)) as NSAttributedString
        var newString = lhs
        newString += rhs
        let leftAttributes: [NSAttributedString.Key: NSObject] = [.font: Font.systemFont(ofSize: 19)]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as NSDictionary, leftAttributes as NSDictionary)
        let rightAttributes: [NSAttributedString.Key: NSObject] = [
            .foregroundColor: Color.magenta,
            .backgroundColor: Color.orange,
            .font: Font.boldSystemFont(ofSize: 24)
        ]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as NSDictionary, rightAttributes as NSDictionary)
    }
    
    //  NSAttributedString + NSMutableAttributedString
    func testOverloadedAssignedAdditionOperator3() {
        let lhs = "Hello".withFont(.systemFont(ofSize: 19)) as NSAttributedString
        let rhs = "World".withTextColor(.magenta).withBackgroundColor(.orange).withFont(.boldSystemFont(ofSize: 24))
        var newString = lhs
        newString += rhs
        let leftAttributes: [NSAttributedString.Key: NSObject] = [.font: Font.systemFont(ofSize: 19)]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as NSDictionary, leftAttributes as NSDictionary)
        let rightAttributes: [NSAttributedString.Key: NSObject] = [
            .foregroundColor: Color.magenta,
            .backgroundColor: Color.orange,
            .font: Font.boldSystemFont(ofSize: 24)
        ]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as NSDictionary, rightAttributes as NSDictionary)
    }
    
    //  NSMutableAttributedString + NSMutableAttributedString
    func testOverloadedAssignedAdditionOperator4() {
        let lhs = "Hello".withFont(.systemFont(ofSize: 19))
        let rhs = "World".withTextColor(.magenta).withBackgroundColor(.orange).withFont(.boldSystemFont(ofSize: 24))
        var newString = lhs
        newString += rhs
        let leftAttributes: [NSAttributedString.Key: NSObject] = [.font: Font.systemFont(ofSize: 19)]
        XCTAssertEqual(newString.attributes(at: 0, effectiveRange: nil) as NSDictionary, leftAttributes as NSDictionary)
        let rightAttributes: [NSAttributedString.Key: NSObject] = [
            .foregroundColor: Color.magenta,
            .backgroundColor: Color.orange,
            .font: Font.boldSystemFont(ofSize: 24)
        ]
        XCTAssertEqual(newString.attributes(at: lhs.length + 1, effectiveRange: nil) as NSDictionary, rightAttributes as NSDictionary)
    }

}
