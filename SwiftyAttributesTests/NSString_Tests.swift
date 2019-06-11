//
//  NSString_Tests.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 02/06/2019.
//  Copyright © 2019 Roman Podymov. All rights reserved.
//

import XCTest
import SwiftyAttributes

class NSString_Tests: XCTestCase {
    
    private let subjectAttributes: [Attribute] = [
        .baselineOffset(10.0),
        .font(.systemFont(ofSize: 19)),
        .textColor(.magenta)
    ]
    
    private let expectedAttributes: [NSAttributedString.Key : Any] = [
        .baselineOffset : 10.0,
        .font : Font.systemFont(ofSize: 19),
        .foregroundColor : Color.magenta
    ]
    
    func testSizeWithSwiftyAttributes() {
        let testString = "Hello World" as NSString
        let subject = testString.swiftySize(withSwiftyAttributes: subjectAttributes)
        let expected = testString.size(withAttributes: expectedAttributes)
        XCTAssertEqual(subject, expected)
    }
    
    func testBoundingRectWithSizeOptionsSwiftyAttributesContext() {
        let testString = "Hello World" as NSString
        let testSize = CGSize(width: 50, height: 100)
        let subject = testString.swiftyBoundingRect(
            with: testSize,
            options: [],
            swiftyAttributes: subjectAttributes,
            context: nil
        )
        let expected = testString.boundingRect(
            with: testSize,
            options: [],
            attributes: expectedAttributes,
            context: nil
        )
        XCTAssertEqual(subject, expected)
    }
    
    #if os(macOS)
    func testBoundingRectWithSizeOptionsSwiftyAttributes() {
        let testString = "Hello World" as NSString
        let testSize = CGSize(width: 50, height: 100)
        let subject = testString.swiftyBoundingRect(
            with: testSize,
            options: [],
            swiftyAttributes: subjectAttributes
        )
        let expected = testString.boundingRect(
            with: testSize,
            options: [],
            attributes: expectedAttributes
        )
        XCTAssertEqual(subject, expected)
    }
    #endif
}
