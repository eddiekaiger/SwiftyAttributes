//
//  NSAttributedString_Tests.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/28/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class NSAttributedString_Tests: XCTestCase {
    
    func testInit_withStringAndAttributes() {
        let subject = NSAttributedString(string: "Hello World", attributes: [.strokeColor(.green), .strokeWidth(3)])
        let expected = NSAttributedString(string: "Hello World", attributes: [NSStrokeColorAttributeName: Color.green, NSStrokeWidthAttributeName: 3])
        XCTAssertEqual(subject, expected)
    }

    func testSubstringFromRange() {
        let str = "Hello".withStrikethroughColor(.blue).withUnderlineStyle(.patternDash)
        str.addAttributes([.backgroundColor(.brown)], range: 0 ..< 3)
        let subject = str.attributedSubstring(from: 1 ..< 4)
        let expected = str.attributedSubstring(from: NSRange(location: 1, length: 3))
        XCTAssertEqual(subject, expected)
    }

    // MARK: - Attribute At Location

    func testAttributeAtLocation_attachment() {
        let attachment = TextAttachment()
        #if os(macOS)
            attachment.image = NSImage()
        #else
            attachment.image = UIImage(named: "Star", in: Bundle(for: type(of: self)), compatibleWith: nil)!
        #endif
        let str = "Hello".withAttachment(attachment)
        let subject = str.attribute(.attachment, at: 0, effectiveRange: nil)!.value as! TextAttachment
        let expected = str.attribute(NSAttachmentAttributeName, at: 0, effectiveRange: nil) as! TextAttachment
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, attachment)
    }

    func testAttributeAtLocation_baselineOffet() {
        let str = "Hello".withBaselineOffset(4.2)
        let subject = str.attribute(.baselineOffset, at: 0, effectiveRange: nil)!.value as! Double
        let expected = str.attribute(NSBaselineOffsetAttributeName, at: 0, effectiveRange: nil) as! Double
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 4.2)
    }

    func testAttributeAtLocation_backgroundColor() {
        let str = "Hello".withBackgroundColor(.blue)
        let subject = str.attribute(.backgroundColor, at: 0, effectiveRange: nil)!.value as! Color
        let expected = str.attribute(NSBackgroundColorAttributeName, at: 0, effectiveRange: nil) as! Color
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .blue)
    }

    func testAttributeAtLocation_expansion() {
        let str = "Hello".withExpansion(5)
        let subject = str.attribute(.expansion, at: 0, effectiveRange: nil)!.value as! Double
        let expected = str.attribute(NSExpansionAttributeName, at: 0, effectiveRange: nil) as! Double
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 5)
    }

    func testAttributeAtLocation_font() {
        let str = "Hello".withFont(.systemFont(ofSize: 26))
        let subject = str.attribute(.font, at: 0, effectiveRange: nil)!.value as! Font
        let expected = str.attribute(NSFontAttributeName, at: 0, effectiveRange: nil) as! Font
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .systemFont(ofSize: 26))
    }

    func testAttributeAtLocation_kern() {
        let str = "Hello".withKern(3)
        let subject = str.attribute(.kern, at: 0, effectiveRange: nil)!.value as! Double
        let expected = str.attribute(NSKernAttributeName, at: 0, effectiveRange: nil) as! Double
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 3)
    }

    func testAttributeAtLocation_ligatures() {
        let str = "Hello".withLigatures(.none)
        let subject = str.attribute(.ligature, at: 0, effectiveRange: nil)!.value as! Ligatures
        let value = str.attribute(NSLigatureAttributeName, at: 0, effectiveRange: nil) as! Int
        let expected = Ligatures(rawValue: value)!
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .none)
    }

    func testAttributeAtLocation_link() {
        let str = "Hello".withLink(URL(string: "https://weebly.com")!)
        let subject = str.attribute(.link, at: 0, effectiveRange: nil)!.value as! URL
        let expected = str.attribute(NSLinkAttributeName, at: 0, effectiveRange: nil) as! URL
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, URL(string: "https://weebly.com"))
    }

    func testAttributeAtLocation_obliqueness() {
        let str = "Hello".withObliqueness(8.7)
        let subject = str.attribute(.obliqueness, at: 0, effectiveRange: nil)!.value as! Double
        let expected = str.attribute(NSObliquenessAttributeName, at: 0, effectiveRange: nil) as! Double
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 8.7)
    }

    func testAttributeAtLocation_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3.4
        style.alignment = .right
        let str = "Hello".withParagraphStyle(style)
        let subject = str.attribute(.paragraphStyle, at: 0, effectiveRange: nil)!.value as! ParagraphStyle
        let expected = str.attribute(NSParagraphStyleAttributeName, at: 0, effectiveRange: nil) as! ParagraphStyle
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, style)
    }

    func testAttributeAtLocation_shadow() {
        let shadow = Shadow()
        shadow.shadowOffset = CGSize(width: 3, height: 5)
        let str = "Hello".withShadow(shadow)
        let subject = str.attribute(.shadow, at: 0, effectiveRange: nil)!.value as! Shadow
        let expected = str.attribute(NSShadowAttributeName, at: 0, effectiveRange: nil) as! Shadow
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, shadow)
    }

    func testAttributeAtLocation_strokeColor() {
        let str = "Hello".withStrokeColor(.magenta)
        let subject = str.attribute(.strokeColor, at: 0, effectiveRange: nil)!.value as! Color
        let expected = str.attribute(NSStrokeColorAttributeName, at: 0, effectiveRange: nil) as! Color
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .magenta)
    }

    func testAttributeAtLocation_strokeWidth() {
        let str = "Hello".withStrokeWidth(2.2)
        let subject = str.attribute(.strokeWidth, at: 0, effectiveRange: nil)!.value as! Double
        let expected = str.attribute(NSStrokeWidthAttributeName, at: 0, effectiveRange: nil) as! Double
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 2.2)
    }

    func testAttributeAtLocation_strikethroughColor() {
        let str = "Hello".withStrikethroughColor(.orange)
        let subject = str.attribute(.strikethroughColor, at: 0, effectiveRange: nil)!.value as! Color
        let expected = str.attribute(NSStrikethroughColorAttributeName, at: 0, effectiveRange: nil) as! Color
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .orange)
    }

    func testAttributeAtLocation_strikethroughStyle() {
        let str = "Hello".withStrikethroughStyle(.styleDouble)
        let subject = str.attribute(.strikethroughStyle, at: 0, effectiveRange: nil)!.value as! StrikethroughStyle
        let expected = str.attribute(NSStrikethroughStyleAttributeName, at: 0, effectiveRange: nil) as! Int
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .styleDouble)
    }

    func testAttributeAtLocation_textColor() {
        let str = "Hello".withTextColor(.green)
        let subject = str.attribute(.textColor, at: 0, effectiveRange: nil)!.value as! Color
        let expected = str.attribute(NSForegroundColorAttributeName, at: 0, effectiveRange: nil) as! Color
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .green)
    }

    func testAttributeAtLocation_textEffect() {
        let str = "Hello".withTextEffect(.letterPressStyle)
        let subject = str.attribute(.textEffect, at: 0, effectiveRange: nil)!.value as! TextEffect
        let expected = str.attribute(NSTextEffectAttributeName, at: 0, effectiveRange: nil) as! String
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject.rawValue, NSTextEffectLetterpressStyle)
    }

    func testAttributeAtLocation_underlineColor() {
        let str = "Hello".withUnderlineColor(.blue)
        let subject = str.attribute(.underlineColor, at: 0, effectiveRange: nil)!.value as! Color
        let expected = str.attribute(NSUnderlineColorAttributeName, at: 0, effectiveRange: nil) as! Color
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .blue)
    }

    func testAttributeAtLocation_underlineStyle() {
        let str = "Hello".withUnderlineStyle(.byWord)
        let subject = str.attribute(.underlineStyle, at: 0, effectiveRange: nil)!.value as! UnderlineStyle
        let expected = str.attribute(NSUnderlineStyleAttributeName, at: 0, effectiveRange: nil) as! Int
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .byWord)
    }

    func testAttributeAtLocation_verticalGlyphForm() {
        let str = "Hello".withVerticalGlyphForm(.horizontal)
        let subject = str.attribute(.verticalGlyphForm, at: 0, effectiveRange: nil)!.value as! VerticalGlyphForm
        let expected = str.attribute(NSVerticalGlyphFormAttributeName, at: 0, effectiveRange: nil) as! Int
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .horizontal)
    }

    func testAttributeAtLocation_writingDirections() {
        let str = "Hello".withWritingDirections([.leftToRightOverride, .rightToLeftEmbedding])
        let subject = str.attribute(.writingDirection, at: 0, effectiveRange: nil)!.value as! [WritingDirection]
        let expected = str.attribute(NSWritingDirectionAttributeName, at: 0, effectiveRange: nil) as! [Int]
        XCTAssertEqual(subject.map { $0.rawValue }, expected)
        XCTAssertFalse(subject.isEmpty)
    }

    func testAttributeAtLocation_noSuchAttribute() {
        let str = "Hello".withUnderlineColor(.magenta)
        let subject = str.attribute(.backgroundColor, at: 0, effectiveRange: nil)
        let expected = str.attribute(NSBackgroundColorAttributeName, at: 0, effectiveRange: nil)
        XCTAssertNil(subject)
        XCTAssertNil(expected)
    }

    func testAttributeAtLocation_effectiveRange_attributeNonNil() {
        let str = "Hello".withUnderlineStyle(.patternDot) + "World".withUnderlineColor(.magenta)
        var swiftyRange = NSRange()
        var foundationRange = NSRange()
        let subject = str.attribute(.underlineStyle, at: 0, effectiveRange: &swiftyRange)!.value as! UnderlineStyle
        let expected = str.attribute(NSUnderlineStyleAttributeName, at: 0, effectiveRange: &foundationRange) as! Int
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .patternDot)
        XCTAssertEqual(swiftyRange.length, foundationRange.length)
        XCTAssertEqual(swiftyRange.location, foundationRange.location)
        XCTAssertEqual(swiftyRange.length, 5)
        XCTAssertEqual(swiftyRange.location, 0)
    }

    func testAttributeAtLocation_effectiveRange_attributeIsNil() {
        let str = "Hello".withUnderlineStyle(.patternDot) + "World".withUnderlineColor(.magenta) + "!".withUnderlineStyle(.byWord)
        var swiftyRange = NSRange()
        var foundationRange = NSRange()
        let subject = str.attribute(.underlineStyle, at: 6, effectiveRange: &swiftyRange)
        let expected = str.attribute(NSUnderlineStyleAttributeName, at: 6, effectiveRange: &foundationRange)
        XCTAssertNil(subject)
        XCTAssertNil(expected)
        XCTAssertEqual(swiftyRange.length, foundationRange.length)
        XCTAssertEqual(swiftyRange.location, foundationRange.location)
        XCTAssertEqual(swiftyRange.length, 5)
        XCTAssertEqual(swiftyRange.location, 5)
    }

    #if os(macOS)

    func testAttributeAtLocation_cursor() {
        let cursor = Cursor(image: NSImage(), foregroundColorHint: .blue, backgroundColorHint: .red, hotSpot: NSPoint(x: 2, y: 2))
        let str = "Hello".withCursor(cursor)
        let subject = str.attribute(.cursor, at: 0, effectiveRange: nil)!.value as! Cursor
        let expected = str.attribute(NSCursorAttributeName, at: 0, effectiveRange: nil) as! Cursor
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, cursor)
    }

    func testAttributeAtLocation_markedClauseSegment() {
        let str = "Hello".withMarkedClauseSegment(2)
        let subject = str.attribute(.markedClauseSegment, at: 0, effectiveRange: nil)!.value as! Int
        let expected = str.attribute(NSMarkedClauseSegmentAttributeName, at: 0, effectiveRange: nil) as! Int
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 2)
    }

    func testAttributeAtLocation_spellingState() {
        let str = "Hello".withSpellingState(.grammarFlag)
        let subject = str.attribute(.spellingState, at: 0, effectiveRange: nil)!.value as! SpellingState
        let expected = str.attribute(NSSpellingStateAttributeName, at: 0, effectiveRange: nil) as! Int
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .grammarFlag)
    }

    func testAttributeAtLocation_superscript() {
        let str = "Hello".withSuperscript(3)
        let subject = str.attribute(.superscript, at: 0, effectiveRange: nil)!.value as! Int
        let expected = str.attribute(NSSuperscriptAttributeName, at: 0, effectiveRange: nil) as! Int
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 3)
    }

    func testAttributeAtLocation_textAlternatives() {
        let alternatives = TextAlternatives(primaryString: "Hi", alternativeStrings: ["Sup", "Yo"])
        let str = "Hello".withTextAlternatives(alternatives)
        let subject = str.attribute(.textAlternatives, at: 0, effectiveRange: nil)!.value as! TextAlternatives
        let expected = str.attribute(NSTextAlternativesAttributeName, at: 0, effectiveRange: nil) as! TextAlternatives
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, alternatives)
    }

    func testAttributeAtLocation_toolTip() {
        let str = "Hello".withToolTip("Yo")
        let subject = str.attribute(.toolTip, at: 0, effectiveRange: nil)!.value as! String
        let expected = str.attribute(NSToolTipAttributeName, at: 0, effectiveRange: nil) as! String
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, "Yo")
    }

    // MARK: - Font Attributes

    func testFontAttributes_onlyFontAttributes() {
        let subject = "Hello".withFont(.systemFont(ofSize: 19)).fontAttributes(in: 0 ..< 3).foundationAttributes
        let expected = NSAttributedString(string: "Hello", attributes: [NSFontAttributeName: Font.systemFont(ofSize: 19)]).fontAttributes(in: NSRange(location: 0, length: 3))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.font(.systemFont(ofSize: 19))])
    }

    func testFontAttributes_includesNonFontAttributes() {
        let url = URL(string: "www.google.com")!
        let subject = "Hello".withAttributes([.font(.systemFont(ofSize: 19)), .link(url)]).fontAttributes(in: 0 ..< 3).foundationAttributes
        let expected = NSAttributedString(string: "Hello", attributes: [NSFontAttributeName: Font.systemFont(ofSize: 19), NSLinkAttributeName: url]).fontAttributes(in: NSRange(location: 0, length: 3))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.font(.systemFont(ofSize: 19))])
    }

    // MARK: - Ruler Attributes

    func testRulerAttributes_onlyRulerAttributes() {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let subject = "Hello".withParagraphStyle(style).rulerAttributes(in: 1 ..< 3).foundationAttributes
        let expected = NSAttributedString(string: "Hello", attributes: [NSParagraphStyleAttributeName: style]).rulerAttributes(in: NSRange(location: 1, length: 2))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.paragraphStyle(style)])
    }

    func testRulerAttributes_includesNonRulerAttributes() {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let subject = "Hello".withAttributes([.paragraphStyle(style), .textColor(.cyan)]).rulerAttributes(in: 1 ..< 3).foundationAttributes
        let expected = NSAttributedString(string: "Hello", attributes: [NSParagraphStyleAttributeName: style, NSForegroundColorAttributeName: Color.cyan]).rulerAttributes(in: NSRange(location: 1, length: 2))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.paragraphStyle(style)])
    }

    #endif

    // MARK: Enumeration

    func testEnumerateSingleAttribute() {
        let str = "Hello".withExpansion(3) + "World".attributedString
        var enumerated = false
        str.enumerateAttribute(.expansion, in: 0 ..< 7) { value, range, _ in
            enumerated = true
            if range.upperBound == 5 {
                XCTAssertEqual(value as! Double, 3)
                XCTAssertEqual(range, 0 ..< 5)
            } else {
                XCTAssertNil(value)
                XCTAssertEqual(range, 5 ..< 7)
            }
        }
        XCTAssertTrue(enumerated)
    }

    func testEnumerateMultipleAttributes() {
        var attrs: [Attribute] = [.backgroundColor(.red), .baselineOffset(2), .obliqueness(3)]
        let str = "Hello World! How is everyone?".attributedString
        str.addAttributes(attrs, range: 0 ..< 7)
        attrs[2] = .obliqueness(2)
        str.addAttributes(attrs, range: 7 ..< 12)
        str.addAttributes(attrs + [.kern(4)], range: 12 ..< 17)

        let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }

        var enumerated = false
        str.enumerateAttributes(in: 3 ..< 15) { attrs, range, _ in
            enumerated = true

            switch range.upperBound {
            case 7:
                XCTAssertEqual(attrs.sorted(by: sort), [.backgroundColor(.red), .baselineOffset(2), .obliqueness(3)])
                XCTAssertEqual(range, 3 ..< 7)
            case 12:
                XCTAssertEqual(attrs.sorted(by: sort), [.backgroundColor(.red), .baselineOffset(2), .obliqueness(2)])
                XCTAssertEqual(range, 7 ..< 12)
            case 15:
                XCTAssertEqual(attrs.sorted(by: sort), [.backgroundColor(.red), .baselineOffset(2), .kern(4), .obliqueness(2)])
                XCTAssertEqual(range, 12 ..< 15)
            default:
                break
            }
        }

        XCTAssertTrue(enumerated)
    }

    func testEnumerate_stopValue() {
        let str = "Hello".withBackgroundColor(.blue) + "World".withKern(3) + "!".withTextColor(.magenta)
        var enumerations = 0
        str.enumerateAttributes(in: 0 ..< str.length) { _ in
            enumerations += 1
        }
        XCTAssertEqual(enumerations, 3)
        enumerations = 0
        str.enumerateAttributes(in: 0 ..< str.length) { _, _, stop in
            enumerations += 1
            if enumerations == 2 {
                stop.pointee = ObjCBool(true)
            }
        }
        XCTAssertEqual(enumerations, 2)
    }

    func testEnumerate_options() {
        let str = "Hello".withExpansion(3) + "World".attributedString
        var enumeratedEnding = false
        str.enumerateAttribute(.expansion, in: 0 ..< 7, options: .reverse) { value, range, _ in
            if range.upperBound == 7 {
                enumeratedEnding = true
                XCTAssertNil(value)
            } else {
                XCTAssertTrue(enumeratedEnding)
                XCTAssertEqual(value as! Double, 3)
            }
        }
    }

    func testEnumerate_returnsArrayOfTuples() {
        var attrs: [Attribute] = [.backgroundColor(.red), .obliqueness(3)]
        let str = "Hello World! How is everyone?".attributedString
        str.addAttributes(attrs, range: 0 ..< 7)
        attrs[1] = .obliqueness(2)
        str.addAttributes(attrs, range: 7 ..< 12)
        str.addAttributes(attrs + [.kern(4)], range: 12 ..< 17)

        let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }

        let subject = str.attributes(in: 3 ..< 15)
        let expected: [([Attribute], Range<Int>)] = [
            ([.backgroundColor(.red), .obliqueness(3)], 3 ..< 7),
            ([.backgroundColor(.red), .obliqueness(2)], 7 ..< 12),
            ([.backgroundColor(.red), .kern(4), .obliqueness(2)], 12 ..< 15)
        ]

        XCTAssertEqual(subject.count, 3)

        for (index, tuple) in subject.enumerated() {
            XCTAssertEqual(tuple.0.sorted(by: sort), expected[index].0.sorted(by: sort))
            XCTAssertEqual(tuple.1, expected[index].1)
        }
    }

}
