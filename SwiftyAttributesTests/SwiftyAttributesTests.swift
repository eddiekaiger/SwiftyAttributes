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
        let subject = "Hello".withFont(UIFont.boldSystemFontOfSize(26))
        let expected = NSAttributedString(string: "Hello", attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(26)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        style.lineBreakMode = .ByTruncatingMiddle
        let subject = "Hello".withParagraphStyle(style)
        let expected = NSAttributedString(string: "Hello", attributes: [NSParagraphStyleAttributeName: style])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_textColor() {
        let subject = "Hello".withTextColor(.magentaColor())
        let expected = NSAttributedString(string: "Hello", attributes: [NSForegroundColorAttributeName: UIColor.magentaColor()])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_backgroundColor() {
        let subject = "Hello".withBackgroundColor(.cyanColor())
        let expected = NSAttributedString(string: "Hello", attributes: [NSBackgroundColorAttributeName: UIColor.cyanColor()])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_ligature() {
        let subject = "Hello".withLigatures(.none)
        let expected = NSAttributedString(string: "Hello", attributes: [NSLigatureAttributeName: NSNumber(integer: Ligatures.none.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_kern() {
        let subject = "Hello".withKern(12)
        let expected = NSAttributedString(string: "Hello", attributes: [NSKernAttributeName: NSNumber(double: 12)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strikethroughStyle() {
        let subject = "Hello".withStrikethroughStyle(.PatternDashDot)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrikethroughStyleAttributeName: NSNumber(integer: NSUnderlineStyle.PatternDashDot.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strokeColor() {
        let subject = "Hello".withStrokeColor(.orangeColor())
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrokeColorAttributeName: UIColor.orangeColor()])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_shadow() {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 4
        shadow.shadowColor = UIColor.brownColor()
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
        let url = NSURL(string: "https://google.com")!
        let subject = "Hello".withLink(url)
        let expected = NSAttributedString(string: "Hello", attributes: [NSLinkAttributeName: url])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_baselineOffset() {
        let subject = "Hello".withBaselineOffset(5)
        let expected = NSAttributedString(string: "Hello", attributes: [NSBaselineOffsetAttributeName: NSNumber(double: 5)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_underlineColor() {
        let subject = "Hello".withUnderlineColor(.magentaColor())
        let expected = NSAttributedString(string: "Hello", attributes: [NSUnderlineColorAttributeName: UIColor.magentaColor()])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strikethroughColor() {
        let subject = "Hello".withStrikethroughColor(.brownColor())
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrikethroughColorAttributeName: UIColor.brownColor()])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_obliqueness() {
        let subject = "Hello".withObliqueness(4.5)
        let expected = NSAttributedString(string: "Hello", attributes: [NSObliquenessAttributeName: NSNumber(double: 4.5)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_expansion() {
        let subject = "Hello".withExpansion(7)
        let expected = NSAttributedString(string: "Hello", attributes: [NSExpansionAttributeName: NSNumber(double: 7)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_writingDirection() {
        let subject = "Hello".withWritingDirections([.LeftToRightOverride, .RightToLeftEmbedding])
        let directions = [
            NSWritingDirection.LeftToRight.rawValue | NSWritingDirectionFormatType.Override.rawValue,
            NSWritingDirection.RightToLeft.rawValue | NSWritingDirectionFormatType.Embedding.rawValue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: [NSWritingDirectionAttributeName: directions])
        XCTAssertEqual(subject, expected)
    }
    
}
