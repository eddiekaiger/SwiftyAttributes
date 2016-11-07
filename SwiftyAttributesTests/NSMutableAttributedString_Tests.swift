//
//  NSMutableAttributedString_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/28/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class NSMutableAttributedString_Tests: XCTestCase {
    
    func testAddAttributes_usingSwiftRange() {
        let subject = "Hello".withTextColor(.orange)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.addAttributes([.link(URL(string: "https://google.com")!)], range: 1 ..< 3)
        XCTAssertNotEqual(subject, expected)
        expected.addAttributes([NSLinkAttributeName: URL(string: "https://google.com")!], range: NSRange(location: 1, length: 2))
        XCTAssertEqual(subject, expected)
    }

    func testAddAttributes_usingNSRange() {
        let subject = "Hello".withBackgroundColor(.cyan)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.addAttributes([.font(.boldSystemFont(ofSize: 17))], range: NSRange(location: 0, length: 1))
        XCTAssertNotEqual(subject, expected)
        expected.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17)], range: NSRange(location: 0, length: 1))
        XCTAssertEqual(subject, expected)
    }

    func testSetAttributes_usingSwiftRange() {
        let subject = "Hello".withBackgroundColor(.yellow)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.setAttributes([.backgroundColor(.orange)], range: 0 ..< 3)
        XCTAssertNotEqual(subject, expected)
        expected.setAttributes([NSBackgroundColorAttributeName: UIColor.orange], range: NSRange(location: 0, length: 3))
        XCTAssertEqual(subject, expected)
    }

    func testSetAttributes_usingNSRange() {
        let subject = "Hello".withBackgroundColor(.yellow)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.setAttributes([.backgroundColor(.orange)], range: NSRange(location: 2, length: 2))
        XCTAssertNotEqual(subject, expected)
        expected.setAttributes([NSBackgroundColorAttributeName: UIColor.orange], range: NSRange(location: 2, length: 2))
        XCTAssertEqual(subject, expected)
    }

    func testReplaceCharacters_withString() {
        let subject = "Hello".withStrokeColor(.brown)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.replaceCharacters(in: 0 ..< 2, with: "Chi")
        XCTAssertNotEqual(subject, expected)
        expected.replaceCharacters(in: NSRange(location: 0, length: 2), with: "Chi")
        XCTAssertEqual(subject, expected)
    }

    func testReplaceCharacters_withAttributedString() {
        let subject = "Hello".withStrokeColor(.brown)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.replaceCharacters(in: 0 ..< 2, with: "Chi".withBackgroundColor(.magenta))
        XCTAssertNotEqual(subject, expected)
        expected.replaceCharacters(in: NSRange(location: 0, length: 2), with: NSAttributedString(string: "Chi", attributes: [NSBackgroundColorAttributeName: UIColor.magenta]))
        XCTAssertEqual(subject, expected)
    }

    func testDeleteCharacters() {
        let subject = "Hello".withStrikethroughColor(.blue)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.deleteCharacters(in: 2 ..< 4)
        XCTAssertNotEqual(subject, expected)
        expected.deleteCharacters(in: NSRange(location: 2, length: 2))
        XCTAssertEqual(subject, expected)
    }

    func testRemoveAttribute() {
        let subject = "Hello".withBaselineOffset(3)
        let expected = subject.mutableCopy() as! NSMutableAttributedString
        XCTAssertEqual(subject, expected)
        subject.removeAttribute(.baselineOffset, range: 1 ..< 4)
        XCTAssertNotEqual(subject, expected)
        expected.removeAttribute(NSBaselineOffsetAttributeName, range: NSRange(location: 1, length: 3))
        XCTAssertEqual(subject, expected)
    }
    
}
