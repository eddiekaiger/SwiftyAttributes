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
        #if swift(>=4.0)
            let dict: [NSAttributedStringKey: Any] = [
                .baselineOffset: 3.2,
                .expansion: 5,
                .underlineStyle: NSUnderlineStyle.styleDouble.rawValue
            ]
            let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        #else
            let dict: [String: Any] = [
                NSBaselineOffsetAttributeName: 3.2,
                NSExpansionAttributeName: 5,
                NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue
            ]
            let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }
        #endif
        let expected: [Attribute] = [
            .baselineOffset(3.2),
            .expansion(5),
            .underlineStyle(.styleDouble)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }

    #if swift(>=4.0)
    #else
    func testDictionaryToSwiftyAttributes_withInvalidValues() {
        let dict: [String: Any] = [
            NSBaselineOffsetAttributeName: 3.2,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue,
            "Sah dude": 5
        ]
        let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }
        let expected: [Attribute] = [
            .baselineOffset(3.2),
            .underlineStyle(.styleDouble)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }
    #endif

    func testAttributesArrayToFoundationDictionary() {
        let attrs: [Attribute] = [
            .kern(3.5),
            .link(URL(string: "www.google.com")!)
        ]
        #if swift(>=4.0)
            let expected: [NSAttributedStringKey: Any] = [
                .kern: 3.5,
                .link: URL(string: "www.google.com")!
            ]
        #else
            let expected: [String: Any] = [
                NSKernAttributeName: 3.5,
                NSLinkAttributeName: URL(string: "www.google.com")!
            ]
        #endif
        XCTAssertEqual(expected as NSDictionary, attrs.foundationAttributes as NSDictionary)
    }
    
}
