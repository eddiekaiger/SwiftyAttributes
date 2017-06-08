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
        let dict: [NSAttributedStringKey: Any] = [
            .baselineOffset: 3.2,
            .expansion: 5,
            .underlineStyle: NSUnderlineStyle.styleDouble.rawValue
        ]
        let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        let expected: [Attribute] = [
            .baselineOffset(3.2),
            .expansion(5),
            .underlineStyle(.styleDouble)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }

    func testDictionaryToSwiftyAttributes_withInvalidValues() {
        let dict: [NSAttributedStringKey: Any] = [
            .baselineOffset: 3.2,
            .underlineStyle: NSUnderlineStyle.styleDouble.rawValue,
            NSAttributedStringKey(rawValue: "Sah dude"): 5
        ]
        let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        let expected: [Attribute] = [
            .baselineOffset(3.2),
            .underlineStyle(.styleDouble)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }

    func testAttributesArrayToFoundationDictionary() {
        let attrs: [Attribute] = [
            .kern(3.5),
            .link(URL(string: "www.google.com")!)
        ]
        let expected: [NSAttributedStringKey: Any] = [
            .kern: 3.5,
            .link: URL(string: "www.google.com")!
        ]
        XCTAssertEqual(expected as NSDictionary, attrs.foundationAttributes as NSDictionary)
    }
    
}
