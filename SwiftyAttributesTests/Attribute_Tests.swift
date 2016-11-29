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
        XCTAssertEqual(Attribute.Name(rawValue: NSAttachmentAttributeName)!, .attachment)
        XCTAssertEqual(Attribute.Name(rawValue: NSBaselineOffsetAttributeName)!, .baselineOffset)
        XCTAssertEqual(Attribute.Name(rawValue: NSBackgroundColorAttributeName)!, .backgroundColor)
        XCTAssertEqual(Attribute.Name(rawValue: NSExpansionAttributeName)!, .expansion)
        XCTAssertEqual(Attribute.Name(rawValue: NSFontAttributeName)!, .font)
        XCTAssertEqual(Attribute.Name(rawValue: NSKernAttributeName)!, .kern)
        XCTAssertEqual(Attribute.Name(rawValue: NSLigatureAttributeName)!, .ligature)
        XCTAssertEqual(Attribute.Name(rawValue: NSLinkAttributeName)!, .link)
        XCTAssertEqual(Attribute.Name(rawValue: NSObliquenessAttributeName)!, .obliqueness)
        XCTAssertEqual(Attribute.Name(rawValue: NSParagraphStyleAttributeName)!, .paragraphStyle)
        XCTAssertEqual(Attribute.Name(rawValue: NSShadowAttributeName)!, .shadow)
        XCTAssertEqual(Attribute.Name(rawValue: NSStrokeColorAttributeName)!, .strokeColor)
        XCTAssertEqual(Attribute.Name(rawValue: NSStrokeWidthAttributeName)!, .strokeWidth)
        XCTAssertEqual(Attribute.Name(rawValue: NSStrikethroughColorAttributeName)!, .strikethroughColor)
        XCTAssertEqual(Attribute.Name(rawValue: NSStrikethroughStyleAttributeName)!, .strikethroughStyle)
        XCTAssertEqual(Attribute.Name(rawValue: NSForegroundColorAttributeName)!, .textColor)
        XCTAssertEqual(Attribute.Name(rawValue: NSTextEffectAttributeName)!, .textEffect)
        XCTAssertEqual(Attribute.Name(rawValue: NSUnderlineColorAttributeName)!, .underlineColor)
        XCTAssertEqual(Attribute.Name(rawValue: NSUnderlineStyleAttributeName)!, .underlineStyle)
        XCTAssertEqual(Attribute.Name(rawValue: NSWritingDirectionAttributeName)!, .writingDirection)
        XCTAssertEqual(Attribute.Name(rawValue: NSVerticalGlyphFormAttributeName)!, .verticalGlyphForm)
        #if os(macOS)
        XCTAssertEqual(Attribute.Name(rawValue: NSCursorAttributeName), .cursor)
        XCTAssertEqual(Attribute.Name(rawValue: NSMarkedClauseSegmentAttributeName), .markedClauseSegment)
        XCTAssertEqual(Attribute.Name(rawValue: NSSpellingStateAttributeName), .spellingState)
        XCTAssertEqual(Attribute.Name(rawValue: NSSuperscriptAttributeName), .superscript)
        XCTAssertEqual(Attribute.Name(rawValue: NSTextAlternativesAttributeName), .textAlternatives)
        XCTAssertEqual(Attribute.Name(rawValue: NSToolTipAttributeName), .toolTip)
        #endif
        XCTAssertNil(Attribute.Name(rawValue: "SomeAttribute"))
    }

}
