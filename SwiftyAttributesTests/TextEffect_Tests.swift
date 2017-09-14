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
        #if swift(>=4.0)
            XCTAssertEqual(TextEffect(rawValue: NSAttributedString.TextEffectStyle.letterpressStyle.rawValue)!, .letterPressStyle)
        #else
            XCTAssertEqual(TextEffect(rawValue: NSTextEffectLetterpressStyle)!, .letterPressStyle)
        #endif
    }

    func testRawValue_letterpress() {
        #if swift(>=4.0)
            XCTAssertEqual(TextEffect.letterPressStyle.rawValue, NSAttributedString.TextEffectStyle.letterpressStyle.rawValue)
        #else
            XCTAssertEqual(TextEffect.letterPressStyle.rawValue, NSTextEffectLetterpressStyle)
        #endif
    }
    
}
