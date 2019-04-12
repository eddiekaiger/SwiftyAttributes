//
//  Attribute+Sequence_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/26/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class Attribute_Sequence_Tests: XCTestCase {
    
    func testDictionaryToSwiftyAttributes() {
        let dict: [NSAttributedString.Key: Any] = [
            .baselineOffset: 3.2,
            .expansion: 5,
            .foregroundColor: Color.red
        ]
        let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        let expected: [Attribute] = [
            .baselineOffset(3.2),
            .expansion(5),
            .textColor(.red)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }

    func testDictionaryToSwiftyAttributes_withCustomValues() {
        let dict: [NSAttributedString.Key: Any] = [
            .baselineOffset: 3.2,
            .foregroundColor: Color.red,
            .init("Foo"): 5
        ]
        let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        let expected: [Attribute] = [
            .baselineOffset(3.2),
            .textColor(.red),
            .custom("Foo", 5)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }

    func testAttributesArrayToFoundationDictionary() {
        let attrs: [Attribute] = [
            .kern(3.5),
            .link(URL(string: "www.google.com")!),
            .custom("Foo", 42)
        ]
        let expected: [NSAttributedString.Key: Any] = [
            .kern: 3.5,
            .link: URL(string: "www.google.com")!,
            .init(rawValue: "Foo"): 42
        ]
        XCTAssertEqual(expected as NSDictionary, attrs.foundationAttributes as NSDictionary)
    }

}
