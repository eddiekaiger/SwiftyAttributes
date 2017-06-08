//
//  Attribute_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/29/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class Attribute_Tests: XCTestCase {
    
    func testAttributeName_initWithRawValue() {
        XCTAssertEqual(Attribute.Name(rawValue: .attachment)!, .attachment)
        XCTAssertEqual(Attribute.Name(rawValue: .baselineOffset)!, .baselineOffset)
        XCTAssertEqual(Attribute.Name(rawValue: .backgroundColor)!, .backgroundColor)
        XCTAssertEqual(Attribute.Name(rawValue: .expansion)!, .expansion)
        XCTAssertEqual(Attribute.Name(rawValue: .font)!, .font)
        XCTAssertEqual(Attribute.Name(rawValue: .kern)!, .kern)
        XCTAssertEqual(Attribute.Name(rawValue: .ligature)!, .ligature)
        XCTAssertEqual(Attribute.Name(rawValue: .link)!, .link)
        XCTAssertEqual(Attribute.Name(rawValue: .obliqueness)!, .obliqueness)
        XCTAssertEqual(Attribute.Name(rawValue: .paragraphStyle)!, .paragraphStyle)
        XCTAssertEqual(Attribute.Name(rawValue: .shadow)!, .shadow)
        XCTAssertEqual(Attribute.Name(rawValue: .strokeColor)!, .strokeColor)
        XCTAssertEqual(Attribute.Name(rawValue: .strokeWidth)!, .strokeWidth)
        XCTAssertEqual(Attribute.Name(rawValue: .strikethroughColor)!, .strikethroughColor)
        XCTAssertEqual(Attribute.Name(rawValue: .strikethroughStyle)!, .strikethroughStyle)
        XCTAssertEqual(Attribute.Name(rawValue: .foregroundColor)!, .textColor)
        XCTAssertEqual(Attribute.Name(rawValue: .textEffect)!, .textEffect)
        XCTAssertEqual(Attribute.Name(rawValue: .underlineColor)!, .underlineColor)
        XCTAssertEqual(Attribute.Name(rawValue: .underlineStyle)!, .underlineStyle)
        XCTAssertEqual(Attribute.Name(rawValue: .writingDirection)!, .writingDirection)
        XCTAssertEqual(Attribute.Name(rawValue: .verticalGlyphForm)!, .verticalGlyphForm)
        #if os(macOS)
        XCTAssertEqual(Attribute.Name(rawValue: .cursor), .cursor)
        XCTAssertEqual(Attribute.Name(rawValue: .markedClauseSegment), .markedClauseSegment)
        XCTAssertEqual(Attribute.Name(rawValue: .spellingState), .spellingState)
        XCTAssertEqual(Attribute.Name(rawValue: .superscript), .superscript)
        XCTAssertEqual(Attribute.Name(rawValue: .textAlternatives), .textAlternatives)
        XCTAssertEqual(Attribute.Name(rawValue: .toolTip), .toolTip)
        #endif
        XCTAssertNil(Attribute.Name(rawValue: NSAttributedStringKey(rawValue: "SomeAttribute")))
    }

}
