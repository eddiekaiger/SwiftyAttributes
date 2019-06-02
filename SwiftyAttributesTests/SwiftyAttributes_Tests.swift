//
//  SwiftyAttributesTests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 9/30/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class SwiftyAttributesTests: XCTestCase {

    func testString_withAttribute() {
        let subject = "Hello".withAttribute(.strokeWidth(4))
        let expected = NSAttributedString(string: "Hello", attributes: [.strokeWidth: NSNumber(value: 4)])
        XCTAssertEqual(subject, expected)
    }
    
    func testAttribute_font() {
        let font = Font.boldSystemFont(ofSize: 26)
        let subject = "Hello".withFont(font)
        let subject2 = "Hello".attributedString.withFont(font)
        let expected = NSAttributedString(string: "Hello", attributes: [.font: Font.boldSystemFont(ofSize: 26)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        style.lineBreakMode = .byTruncatingMiddle
        let subject = "Hello".withParagraphStyle(style)
        let subject2 = "Hello".attributedString.withParagraphStyle(style)
        let expected = NSAttributedString(string: "Hello", attributes: [.paragraphStyle: style])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_textColor() {
        let subject = "Hello".withTextColor(.magenta)
        let subject2 = "Hello".attributedString.withTextColor(.magenta)
        let expected = NSAttributedString(string: "Hello", attributes: [.foregroundColor: Color.magenta])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_backgroundColor() {
        let subject = "Hello".withBackgroundColor(.cyan)
        let subject2 = "Hello".attributedString.withBackgroundColor(.cyan)
        let expected = NSAttributedString(string: "Hello", attributes: [.backgroundColor: Color.cyan])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_ligature() {
        let subject = "Hello".withLigatures(.none)
        let subject2 = "Hello".attributedString.withLigatures(.none)
        let expected = NSAttributedString(string: "Hello", attributes: [.ligature: NSNumber(value: Ligatures.none.rawValue)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_kern() {
        let subject = "Hello".withKern(12)
        let subject2 = "Hello".attributedString.withKern(12)
        let expected = NSAttributedString(string: "Hello", attributes: [.kern: NSNumber(value: 12)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strikethroughStyle() {
        let subject = "Hello".withStrikethroughStyle(.patternDashDot)
        let subject2 = "Hello".attributedString.withStrikethroughStyle(.patternDashDot)
        let expected = NSAttributedString(string: "Hello", attributes: [.strikethroughStyle: NSNumber(value: UnderlineStyle.patternDashDot.rawValue)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_underlineStyle() {
        let underlineStyle = NSUnderlineStyle.double
        let subject = "Hello".withUnderlineStyle(underlineStyle)
        let subject2 = "Hello".attributedString.withUnderlineStyle(underlineStyle)
        let expected = NSAttributedString(string: "Hello", attributes: [.underlineStyle: NSNumber(value: underlineStyle.rawValue)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strokeColor() {
        let subject = "Hello".withStrokeColor(.orange)
        let subject2 = "Hello".attributedString.withStrokeColor(.orange)
        let expected = NSAttributedString(string: "Hello", attributes: [.strokeColor: Color.orange])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strokeWidth() {
        let subject = "Hello".withStrokeWidth(3.2)
        let subject2 = "Hello".attributedString.withStrokeWidth(3.2)
        let expected = NSAttributedString(string: "Hello", attributes: [.strokeWidth: NSNumber(value: 3.2)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_shadow() {
        let shadow = Shadow()
        shadow.shadowBlurRadius = 4
        shadow.shadowColor = Color.brown
        let subject = "Hello".withShadow(shadow)
        let subject2 = "Hello".attributedString.withShadow(shadow)
        let expected = NSAttributedString(string: "Hello", attributes: [.shadow: shadow])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_textEffect() {
        let subject = "Hello".withTextEffect(.letterPressStyle)
        let subject2 = "Hello".attributedString.withTextEffect(.letterPressStyle)
        let expected = NSAttributedString(string: "Hello", attributes: [.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_attachment() {
        let attachment = TextAttachment(data: nil, ofType: nil)
        let subject = "Hello".withAttachment(attachment)
        let subject2 = "Hello".attributedString.withAttachment(attachment)
        let expected = NSAttributedString(string: "Hello", attributes: [.attachment: attachment])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_link() {
        let url = URL(string: "https://google.com")!
        let subject = "Hello".withLink(url)
        let subject2 = "Hello".attributedString.withLink(url)
        let expected = NSAttributedString(string: "Hello", attributes: [.link: url])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_baselineOffset() {
        let subject = "Hello".withBaselineOffset(5)
        let subject2 = "Hello".attributedString.withBaselineOffset(5)
        let expected = NSAttributedString(string: "Hello", attributes: [.baselineOffset: NSNumber(value: 5)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_underlineColor() {
        let subject = "Hello".withUnderlineColor(.magenta)
        let subject2 = "Hello".attributedString.withUnderlineColor(.magenta)
        let expected = NSAttributedString(string: "Hello", attributes: [.underlineColor: Color.magenta])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strikethroughColor() {
        let subject = "Hello".withStrikethroughColor(.brown)
        let subject2 = "Hello".attributedString.withStrikethroughColor(.brown)
        let expected = NSAttributedString(string: "Hello", attributes: [.strikethroughColor: Color.brown])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_obliqueness() {
        let subject = "Hello".withObliqueness(4.5)
        let subject2 = "Hello".attributedString.withObliqueness(4.5)
        let expected = NSAttributedString(string: "Hello", attributes: [.obliqueness: NSNumber(value: 4.5)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_expansion() {
        let subject = "Hello".withExpansion(7)
        let subject2 = "Hello".attributedString.withExpansion(7)
        let expected = NSAttributedString(string: "Hello", attributes: [.expansion: NSNumber(value: 7)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_verticalGlyphForm() {
        let subject = "Hello".withVerticalGlyphForm(.horizontal)
        let subject2 = "Hello".attributedString.withVerticalGlyphForm(.horizontal)
        let expected = NSAttributedString(string: "Hello", attributes: [.verticalGlyphForm: NSNumber(value: 0)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    @available(iOS 9.0, *)
    func testAttribute_writingDirection() {
        let subject = "Hello".withWritingDirections([.rightToLeftOverride])
        let subject2 = "Hello".attributedString.withWritingDirections([.rightToLeftOverride])
        let expected = NSAttributedString(string: "Hello", attributes: [.writingDirection: [NSNumber(value: NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.override.rawValue)]])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_custom() {
        let subject = "Hello".withCustomAttribute(named: "Foo", value: 42)
        let subject2 = "Hello".attributedString.withCustomAttribute(named: "Foo", value: 42)
        let expected = NSAttributedString(string: "Hello", attributes: [.init(rawValue: "Foo"): NSNumber(value: 42)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    #if os(macOS)

    func testAttribute_cursor() {
        let cursor = Cursor(image: NSImage(), foregroundColorHint: .blue, backgroundColorHint: .red, hotSpot: NSPoint(x: 2, y: 2))
        let subject = "Hello".withCursor(cursor)
        let subject2 = "Hello".attributedString.withCursor(cursor)
        let expected = NSAttributedString(string: "Hello", attributes: [.cursor: cursor])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_markedClauseSegment() {
        let subject = "Hello".withMarkedClauseSegment(3)
        let subject2 = "Hello".attributedString.withMarkedClauseSegment(3)
        let expected = NSAttributedString(string: "Hello", attributes: [.markedClauseSegment: 3])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_spellingState_grammar() {
        let subject = "Hello".withSpellingState(.grammar)
        let subject2 = "Hello".attributedString.withSpellingState(.grammar)
        let expected = NSAttributedString(string: "Hello", attributes: [.spellingState: 2])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_superscript() {
        let subject = "Hello".withSuperscript(4)
        let subject2 = "Hello".attributedString.withSuperscript(4)
        let expected = NSAttributedString(string: "Hello", attributes: [.superscript: 4])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_textAlternatives() {
        let alternatives = TextAlternatives(primaryString: "Hi", alternativeStrings: ["Yo", "Sup"])
        let subject = "Hello".withTextAlternatives(alternatives)
        let subject2 = "Hello".attributedString.withTextAlternatives(alternatives)
        let expected = NSAttributedString(string: "Hello", attributes: [.textAlternatives: alternatives])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }
    
    func testAttribute_toolTip() {
        let subject = "Hello".withToolTip("Sah dude")
        let subject2 = "Hello".attributedString.withToolTip("Sah dude")
        let expected = NSAttributedString(string: "Hello", attributes: [.toolTip: "Sah dude"])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    #endif

    func testMultipleAttributes_withSyntax() {
        let subject = "Hello".withTextColor(.darkGray).withBackgroundColor(.magenta).withStrikethroughStyle(.patternDashDotDot)
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: Color.darkGray,
            .backgroundColor: Color.magenta,
            .strikethroughStyle: UnderlineStyle.patternDashDotDot.rawValue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: attrs)
        XCTAssertEqual(subject, expected)
    }

    func testMultipleAttributes_arraySyntax() {
        let attributes: [Attribute] = [.font(.boldSystemFont(ofSize: 19)), .link(URL(string: "https://google.com")!), .textColor(.blue)]
        let subject = "Hello".withAttributes(attributes)
        let subject2 = "Hello".attributedString.withAttributes(attributes)
        let attrs: [NSAttributedString.Key: Any] = [
            .font: Font.boldSystemFont(ofSize: 19),
            .link: URL(string: "https://google.com")!,
            .foregroundColor: Color.blue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: attrs)
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

}
