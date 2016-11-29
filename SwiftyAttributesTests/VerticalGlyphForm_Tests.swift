//
//  VerticalGlyphForm_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/29/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class VerticalGlyphForm_Tests: XCTestCase {
    
    func testRawValue() {
        XCTAssertEqual(VerticalGlyphForm.horizontal.rawValue, 0)
        #if os(macOS)
        XCTAssertEqual(VerticalGlyphForm.vertical.rawValue, 1)
        #endif
    }
    
}
