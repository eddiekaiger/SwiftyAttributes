//
//  SwiftyAttributesTests.swift
//  SwiftyAttributesTests
//
//  Created by Eddie Kaiger on 9/30/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class SwiftyAttributesTests: XCTestCase {

    func testString_withAttribute() {
        let subject = "Hello".withAttribute(.strokeWidth(4))
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.strokeWidth
        #else
            let attributeName = NSStrokeWidthAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 4)])
        XCTAssertEqual(subject, expected)
    }
    
    func testAttribute_font() {
        let font = Font.boldSystemFont(ofSize: 26)
        let subject = "Hello".withFont(font)
        let subject2 = "Hello".attributedString.withFont(font)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.font
        #else
            let attributeName = NSFontAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Font.boldSystemFont(ofSize: 26)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        style.lineBreakMode = .byTruncatingMiddle
        let subject = "Hello".withParagraphStyle(style)
        let subject2 = "Hello".attributedString.withParagraphStyle(style)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.paragraphStyle
        #else
            let attributeName = NSParagraphStyleAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: style])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_textColor() {
        let subject = "Hello".withTextColor(.magenta)
        let subject2 = "Hello".attributedString.withTextColor(.magenta)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.foregroundColor
        #else
            let attributeName = NSForegroundColorAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Color.magenta])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_backgroundColor() {
        let subject = "Hello".withBackgroundColor(.cyan)
        let subject2 = "Hello".attributedString.withBackgroundColor(.cyan)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.backgroundColor
        #else
            let attributeName = NSBackgroundColorAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Color.cyan])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_ligature() {
        let subject = "Hello".withLigatures(.none)
        let subject2 = "Hello".attributedString.withLigatures(.none)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.ligature
        #else
            let attributeName = NSLigatureAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: Ligatures.none.rawValue)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_kern() {
        let subject = "Hello".withKern(12)
        let subject2 = "Hello".attributedString.withKern(12)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.kern
        #else
            let attributeName = NSKernAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 12)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strikethroughStyle() {
        let subject = "Hello".withStrikethroughStyle(.patternDashDot)
        let subject2 = "Hello".attributedString.withStrikethroughStyle(.patternDashDot)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.strikethroughStyle
        #else
            let attributeName = NSStrikethroughStyleAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: UnderlineStyle.patternDashDot.rawValue)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_underlineStyle() {
        let subject = "Hello".withUnderlineStyle(.styleDouble)
        let subject2 = "Hello".attributedString.withUnderlineStyle(.styleDouble)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.underlineStyle
        #else
            let attributeName = NSUnderlineStyleAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: UnderlineStyle.styleDouble.rawValue)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strokeColor() {
        let subject = "Hello".withStrokeColor(.orange)
        let subject2 = "Hello".attributedString.withStrokeColor(.orange)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.strokeColor
        #else
            let attributeName = NSStrokeColorAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Color.orange])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strokeWidth() {
        let subject = "Hello".withStrokeWidth(3.2)
        let subject2 = "Hello".attributedString.withStrokeWidth(3.2)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.strokeWidth
        #else
            let attributeName = NSStrokeWidthAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 3.2)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_shadow() {
        let shadow = Shadow()
        shadow.shadowBlurRadius = 4
        shadow.shadowColor = Color.brown
        let subject = "Hello".withShadow(shadow)
        let subject2 = "Hello".attributedString.withShadow(shadow)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.shadow
        #else
            let attributeName = NSShadowAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: shadow])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_textEffect() {
        let subject = "Hello".withTextEffect(.letterPressStyle)
        let subject2 = "Hello".attributedString.withTextEffect(.letterPressStyle)
        #if swift(>=4.0)
            let expected = NSAttributedString(string: "Hello", attributes: [.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle])
        #else
            let expected = NSAttributedString(string: "Hello", attributes: [NSTextEffectAttributeName: NSTextEffectLetterpressStyle])
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_attachment() {
        let attachment = TextAttachment(data: nil, ofType: nil)
        let subject = "Hello".withAttachment(attachment)
        let subject2 = "Hello".attributedString.withAttachment(attachment)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.attachment
        #else
            let attributeName = NSAttachmentAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: attachment])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_link() {
        let url = URL(string: "https://google.com")!
        let subject = "Hello".withLink(url)
        let subject2 = "Hello".attributedString.withLink(url)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.link
        #else
            let attributeName = NSLinkAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: url])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_baselineOffset() {
        let subject = "Hello".withBaselineOffset(5)
        let subject2 = "Hello".attributedString.withBaselineOffset(5)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.baselineOffset
        #else
            let attributeName = NSBaselineOffsetAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 5)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_underlineColor() {
        let subject = "Hello".withUnderlineColor(.magenta)
        let subject2 = "Hello".attributedString.withUnderlineColor(.magenta)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.underlineColor
        #else
            let attributeName = NSUnderlineColorAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Color.magenta])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_strikethroughColor() {
        let subject = "Hello".withStrikethroughColor(.brown)
        let subject2 = "Hello".attributedString.withStrikethroughColor(.brown)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.strikethroughColor
        #else
            let attributeName = NSStrikethroughColorAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Color.brown])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_obliqueness() {
        let subject = "Hello".withObliqueness(4.5)
        let subject2 = "Hello".attributedString.withObliqueness(4.5)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.obliqueness
        #else
            let attributeName = NSObliquenessAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 4.5)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_expansion() {
        let subject = "Hello".withExpansion(7)
        let subject2 = "Hello".attributedString.withExpansion(7)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.expansion
        #else
            let attributeName = NSExpansionAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 7)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_verticalGlyphForm() {
        let subject = "Hello".withVerticalGlyphForm(.horizontal)
        let subject2 = "Hello".attributedString.withVerticalGlyphForm(.horizontal)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.verticalGlyphForm
        #else
            let attributeName = NSVerticalGlyphFormAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 0)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    @available(iOS 9.0, *)
    func testAttribute_writingDirection() {
        let subject = "Hello".withWritingDirections([.rightToLeftOverride])
        let subject2 = "Hello".attributedString.withWritingDirections([.rightToLeftOverride])
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.writingDirection
        #else
            let attributeName = NSWritingDirectionAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: [NSNumber(value: NSWritingDirection.rightToLeft.rawValue | NSWritingDirectionFormatType.override.rawValue)]])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_custom() {
        let subject = "Hello".withCustomAttribute(named: "Foo", value: 42)
        let subject2 = "Hello".attributedString.withCustomAttribute(named: "Foo", value: 42)
        #if swift(>=4.0)
        let attributeName = NSAttributedStringKey(rawValue: "Foo")
        #else
        let attributeName = "Foo"
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: NSNumber(value: 42)])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    #if os(macOS)

    func testAttribute_cursor() {
        let cursor = Cursor(image: NSImage(), foregroundColorHint: .blue, backgroundColorHint: .red, hotSpot: NSPoint(x: 2, y: 2))
        let subject = "Hello".withCursor(cursor)
        let subject2 = "Hello".attributedString.withCursor(cursor)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.cursor
        #else
            let attributeName = NSCursorAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: cursor])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_markedClauseSegment() {
        let subject = "Hello".withMarkedClauseSegment(3)
        let subject2 = "Hello".attributedString.withMarkedClauseSegment(3)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.markedClauseSegment
        #else
            let attributeName = NSMarkedClauseSegmentAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: 3])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_spellingState_grammar() {
        let subject = "Hello".withSpellingState(.grammar)
        let subject2 = "Hello".attributedString.withSpellingState(.grammar)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.spellingState
        #else
            let attributeName = NSSpellingStateAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: 2])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_superscript() {
        let subject = "Hello".withSuperscript(4)
        let subject2 = "Hello".attributedString.withSuperscript(4)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.superscript
        #else
            let attributeName = NSSuperscriptAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: 4])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    func testAttribute_textAlternatives() {
        let alternatives = TextAlternatives(primaryString: "Hi", alternativeStrings: ["Yo", "Sup"])
        let subject = "Hello".withTextAlternatives(alternatives)
        let subject2 = "Hello".attributedString.withTextAlternatives(alternatives)
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.textAlternatives
        #else
            let attributeName = NSTextAlternativesAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: alternatives])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }
    
    func testAttribute_toolTip() {
        let subject = "Hello".withToolTip("Sah dude")
        let subject2 = "Hello".attributedString.withToolTip("Sah dude")
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.toolTip
        #else
            let attributeName = NSToolTipAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: "Sah dude"])
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

    #endif

    func testMultipleAttributes_withSyntax() {
        let subject = "Hello".withTextColor(.darkGray).withBackgroundColor(.magenta).withStrikethroughStyle(.patternDashDotDot)
        #if swift(>=4.0)
            let attrs: [NSAttributedStringKey: Any] = [
                .foregroundColor: Color.darkGray,
                .backgroundColor: Color.magenta,
                .strikethroughStyle: UnderlineStyle.patternDashDotDot.rawValue
            ]
        #else
            let attrs: [String: Any] = [
                NSForegroundColorAttributeName: Color.darkGray,
                NSBackgroundColorAttributeName: Color.magenta,
                NSStrikethroughStyleAttributeName: UnderlineStyle.patternDashDotDot.rawValue
            ]
        #endif
        
        let expected = NSAttributedString(string: "Hello", attributes: attrs)
        XCTAssertEqual(subject, expected)
    }

    func testMultipleAttributes_arraySyntax() {
        let attributes: [Attribute] = [.font(.boldSystemFont(ofSize: 19)), .link(URL(string: "https://google.com")!), .underlineStyle(.patternSolid)]
        let subject = "Hello".withAttributes(attributes)
        let subject2 = "Hello".attributedString.withAttributes(attributes)
        #if swift(>=4.0)
            let attrs: [NSAttributedStringKey: Any] = [
                .font: Font.boldSystemFont(ofSize: 19),
                .link: URL(string: "https://google.com")!,
                .underlineStyle: UnderlineStyle.patternSolid.rawValue
            ]
        #else
            let attrs: [String: Any] = [
                NSFontAttributeName: Font.boldSystemFont(ofSize: 19),
                NSLinkAttributeName: URL(string: "https://google.com")!,
                NSUnderlineStyleAttributeName: UnderlineStyle.patternSolid.rawValue
            ]
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: attrs)
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject2, expected)
    }

}
