//
//  WritingDirection_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/25/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

@available(iOS 9.0, *)
class WritingDirection_Tests: XCTestCase {

    func testAttribute_writingDirection() {
        let subject = "Hello".withWritingDirections([.leftToRightOverride, .rightToLeftEmbedding, .leftToRightOverride, .rightToLeftEmbedding])
        let directions = [
            NSWritingDirection.leftToRight.rawValue | NSWritingDirectionFormatType.override.rawValue,
            NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.embedding.rawValue,
            NSWritingDirection.leftToRight.rawValue | NSWritingDirectionFormatType.override.rawValue,
            NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.embedding.rawValue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: [NSWritingDirectionAttributeName: directions])
        XCTAssertEqual(subject, expected)
    }

    func testWritingDirectionRawValue() {
        XCTAssertEqual(WritingDirection(rawValue: (NSWritingDirection.leftToRight.rawValue | NSWritingDirectionFormatType.override.rawValue)), .leftToRightOverride)
        XCTAssertEqual(WritingDirection(rawValue: (NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.override.rawValue)), .rightToLeftOverride)
        XCTAssertEqual(WritingDirection(rawValue: (NSWritingDirection.leftToRight.rawValue | NSWritingDirectionFormatType.embedding.rawValue)), .leftToRightEmbedding)
        XCTAssertEqual(WritingDirection(rawValue: (NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.embedding.rawValue)), .rightToLeftEmbedding)
        XCTAssertNil(WritingDirection(rawValue: 12))
    }
    
}
