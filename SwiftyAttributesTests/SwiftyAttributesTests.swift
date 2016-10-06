//
//  SwiftyAttributesTests.swift
//  SwiftyAttributesTests
//
//  Created by Eddie Kaiger on 9/30/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
@testable import SwiftyAttributes

class SwiftyAttributesTests: XCTestCase {
    
    func testAttribute_font() {
        let subject = "Hello".withFont(UIFont.boldSystemFont(ofSize: 26))
        let expected = NSAttributedString(string: "Hello", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 26)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        style.lineBreakMode = .byTruncatingMiddle
        let subject = "Hello".withParagraphStyle(style)
        let expected = NSAttributedString(string: "Hello", attributes: [NSParagraphStyleAttributeName: style])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_textColor() {
        let subject = "Hello".withTextColor(.magenta)
        let expected = NSAttributedString(string: "Hello", attributes: [NSForegroundColorAttributeName: UIColor.magenta])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_backgroundColor() {
        let subject = "Hello".withBackgroundColor(.cyan)
        let expected = NSAttributedString(string: "Hello", attributes: [NSBackgroundColorAttributeName: UIColor.cyan])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_ligature() {
        let subject = "Hello".withLigatures(.none)
        let expected = NSAttributedString(string: "Hello", attributes: [NSLigatureAttributeName: NSNumber(value: Ligatures.none.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_kern() {
        let subject = "Hello".withKern(12)
        let expected = NSAttributedString(string: "Hello", attributes: [NSKernAttributeName: NSNumber(value: 12)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strikethroughStyle() {
        let subject = "Hello".withStrikethroughStyle(.patternDashDot)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrikethroughStyleAttributeName: NSNumber(value: NSUnderlineStyle.patternDashDot.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strokeColor() {
        let subject = "Hello".withStrokeColor(.orange)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrokeColorAttributeName: UIColor.orange])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_shadow() {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 4
        shadow.shadowColor = UIColor.brown
        let subject = "Hello".withShadow(shadow)
        let expected = NSAttributedString(string: "Hello", attributes: [NSShadowAttributeName: shadow])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_textEffect() {
        let subject = "Hello".withTextEffect(NSTextEffectLetterpressStyle)
        let expected = NSAttributedString(string: "Hello", attributes: [NSTextEffectAttributeName: NSTextEffectLetterpressStyle])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_attachment() {
        let attachment = NSTextAttachment(data: nil, ofType: nil)
        let subject = "Hello".withAttachment(attachment)
        let expected = NSAttributedString(string: "Hello", attributes: [NSTextEffectAttributeName: attachment])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_link() {
        let url = URL(string: "https://google.com")!
        let subject = "Hello".withLink(url)
        let expected = NSAttributedString(string: "Hello", attributes: [NSLinkAttributeName: url])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_baselineOffset() {
        let subject = "Hello".withBaselineOffset(5)
        let expected = NSAttributedString(string: "Hello", attributes: [NSBaselineOffsetAttributeName: NSNumber(value: 5)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_underlineColor() {
        let subject = "Hello".withUnderlineColor(.magenta)
        let expected = NSAttributedString(string: "Hello", attributes: [NSUnderlineColorAttributeName: UIColor.magenta])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strikethroughColor() {
        let subject = "Hello".withStrikethroughColor(.brown)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrikethroughColorAttributeName: UIColor.brown])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_obliqueness() {
        let subject = "Hello".withObliqueness(4.5)
        let expected = NSAttributedString(string: "Hello", attributes: [NSObliquenessAttributeName: NSNumber(value: 4.5)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_expansion() {
        let subject = "Hello".withExpansion(7)
        let expected = NSAttributedString(string: "Hello", attributes: [NSExpansionAttributeName: NSNumber(value: 7)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_writingDirection() {
        let subject = "Hello".withWritingDirections([.leftToRightOverride, .rightToLeftEmbedding])
        let directions = [
            NSWritingDirection.leftToRight.rawValue | NSWritingDirectionFormatType.override.rawValue,
            NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.embedding.rawValue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: [NSWritingDirectionAttributeName: directions])
        XCTAssertEqual(subject, expected)
    }
    
}
