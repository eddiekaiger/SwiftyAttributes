//
//  SpellingState_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/26/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

#if os(macOS)
import XCTest
import SwiftyAttributes

class SpellingState_Tests: XCTestCase {
    
    func testInit_nil() {
        XCTAssertNil(SpellingState(rawValue: 6))
    }

    func testInit_flags() {
        XCTAssertEqual(SpellingState(rawValue: 2)!, .grammar)
        XCTAssertEqual(SpellingState(rawValue: 1)!, .spelling)
        XCTAssertNil(SpellingState(rawValue: 0))
    }
    
}
#endif
