//
//  TextEffect_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/29/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class TextEffect_Tests: XCTestCase {
    
    func testInit_nil() {
        XCTAssertNil(TextEffect(rawValue: "Testing"))
    }

    func testInit_letterpress() {
        XCTAssertEqual(TextEffect(rawValue: NSTextEffectLetterpressStyle)!, .letterPressStyle)
    }

    func testRawValue_letterpress() {
        XCTAssertEqual(TextEffect.letterPressStyle.rawValue, NSTextEffectLetterpressStyle)
    }
    
}
