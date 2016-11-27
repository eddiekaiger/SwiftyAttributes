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
        let dict: [String: Any] = [
            NSBaselineOffsetAttributeName: Double(3),
            NSExpansionAttributeName: Double(5),
            NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue
        ]
        let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }
        let expected: [Attribute] = [
            .baselineOffset(3),
            .expansion(5),
            .underlineStyle(.styleDouble)
        ].sorted(by: sort)
        XCTAssertEqual(dict.swiftyAttributes.sorted(by: sort), expected)
    }

    func testAttributesArrayToFoundationDictionary() {
        let attrs: [Attribute] = [
            .kern(3.5),
            .link(URL(string: "www.google.com")!)
        ]
        let expected: [String: Any] = [
            NSKernAttributeName: 3.5,
            NSLinkAttributeName: URL(string: "www.google.com")!
        ]
        XCTAssertEqual(expected as NSDictionary, attrs.foundationAttributes as NSDictionary)
    }
    
}
