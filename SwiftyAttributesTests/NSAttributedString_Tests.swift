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
        #if swift(>=4.0)
            let expected = NSAttributedString(string: "Hello World", attributes: [.strokeColor: Color.green, .strokeWidth: 3])
        #else
            let expected = NSAttributedString(string: "Hello World", attributes: [NSStrokeColorAttributeName: Color.green, NSStrokeWidthAttributeName: 3])
        #endif
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
        let subject = str.swiftyAttribute(.attachment, at: 0, effectiveRange: nil)!.value as! TextAttachment
        #if swift(>=4.0)
            let expected = str.attribute(.attachment, at: 0, effectiveRange: nil) as! TextAttachment
        #else
            let expected = str.attribute(NSAttachmentAttributeName, at: 0, effectiveRange: nil) as! TextAttachment
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, attachment)
    }

    func testAttributeAtLocation_baselineOffet() {
        let str = "Hello".withBaselineOffset(4.2)
        let subject = str.swiftyAttribute(.baselineOffset, at: 0, effectiveRange: nil)!.value as! Double
        #if swift(>=4.0)
            let expected = str.attribute(.baselineOffset, at: 0, effectiveRange: nil) as! Double
        #else
            let expected = str.attribute(NSBaselineOffsetAttributeName, at: 0, effectiveRange: nil) as! Double
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 4.2)
    }

    func testAttributeAtLocation_backgroundColor() {
        let str = "Hello".withBackgroundColor(.blue)
        let subject = str.swiftyAttribute(.backgroundColor, at: 0, effectiveRange: nil)!.value as! Color
        #if swift(>=4.0)
            let expected = str.attribute(.backgroundColor, at: 0, effectiveRange: nil) as! Color
        #else
            let expected = str.attribute(NSBackgroundColorAttributeName, at: 0, effectiveRange: nil) as! Color
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .blue)
    }

    func testAttributeAtLocation_expansion() {
        let str = "Hello".withExpansion(5)
        let subject = str.swiftyAttribute(.expansion, at: 0, effectiveRange: nil)!.value as! Double
        #if swift(>=4.0)
            let expected = str.attribute(.expansion, at: 0, effectiveRange: nil) as! Double
        #else
            let expected = str.attribute(NSExpansionAttributeName, at: 0, effectiveRange: nil) as! Double
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 5)
    }

    func testAttributeAtLocation_font() {
        let str = "Hello".withFont(.systemFont(ofSize: 26))
        let subject = str.swiftyAttribute(.font, at: 0, effectiveRange: nil)!.value as! Font
        #if swift(>=4.0)
            let expected = str.attribute(.font, at: 0, effectiveRange: nil) as! Font
        #else
            let expected = str.attribute(NSFontAttributeName, at: 0, effectiveRange: nil) as! Font
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .systemFont(ofSize: 26))
    }

    func testAttributeAtLocation_kern() {
        let str = "Hello".withKern(3)
        let subject = str.swiftyAttribute(.kern, at: 0, effectiveRange: nil)!.value as! Double
        #if swift(>=4.0)
            let expected = str.attribute(.kern, at: 0, effectiveRange: nil) as! Double
        #else
            let expected = str.attribute(NSKernAttributeName, at: 0, effectiveRange: nil) as! Double
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 3)
    }

    func testAttributeAtLocation_ligatures() {
        let str = "Hello".withLigatures(.none)
        let subject = str.swiftyAttribute(.ligature, at: 0, effectiveRange: nil)!.value as! Ligatures
        #if swift(>=4.0)
            let value = str.attribute(.ligature, at: 0, effectiveRange: nil) as! Int
        #else
            let value = str.attribute(NSLigatureAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        let expected = Ligatures(rawValue: value)!
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .none)
    }

    func testAttributeAtLocation_link() {
        let str = "Hello".withLink(URL(string: "https://weebly.com")!)
        let subject = str.swiftyAttribute(.link, at: 0, effectiveRange: nil)!.value as! URL
        #if swift(>=4.0)
            let expected = str.attribute(.link, at: 0, effectiveRange: nil) as! URL
        #else
            let expected = str.attribute(NSLinkAttributeName, at: 0, effectiveRange: nil) as! URL
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, URL(string: "https://weebly.com"))
    }

    func testAttributeAtLocation_obliqueness() {
        let str = "Hello".withObliqueness(8.7)
        let subject = str.swiftyAttribute(.obliqueness, at: 0, effectiveRange: nil)!.value as! Double
        #if swift(>=4.0)
            let expected = str.attribute(.obliqueness, at: 0, effectiveRange: nil) as! Double
        #else
            let expected = str.attribute(NSObliquenessAttributeName, at: 0, effectiveRange: nil) as! Double
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 8.7)
    }

    func testAttributeAtLocation_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3.4
        style.alignment = .right
        let str = "Hello".withParagraphStyle(style)
        let subject = str.swiftyAttribute(.paragraphStyle, at: 0, effectiveRange: nil)!.value as! ParagraphStyle
        #if swift(>=4.0)
            let expected = str.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as! ParagraphStyle
        #else
            let expected = str.attribute(NSParagraphStyleAttributeName, at: 0, effectiveRange: nil) as! ParagraphStyle
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, style)
    }

    func testAttributeAtLocation_shadow() {
        let shadow = Shadow()
        shadow.shadowOffset = CGSize(width: 3, height: 5)
        let str = "Hello".withShadow(shadow)
        let subject = str.swiftyAttribute(.shadow, at: 0, effectiveRange: nil)!.value as! Shadow
        #if swift(>=4.0)
            let expected = str.attribute(.shadow, at: 0, effectiveRange: nil) as! Shadow
        #else
            let expected = str.attribute(NSShadowAttributeName, at: 0, effectiveRange: nil) as! Shadow
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, shadow)
    }

    func testAttributeAtLocation_strokeColor() {
        let str = "Hello".withStrokeColor(.magenta)
        let subject = str.swiftyAttribute(.strokeColor, at: 0, effectiveRange: nil)!.value as! Color
        #if swift(>=4.0)
            let expected = str.attribute(.strokeColor, at: 0, effectiveRange: nil) as! Color
        #else
            let expected = str.attribute(NSStrokeColorAttributeName, at: 0, effectiveRange: nil) as! Color
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .magenta)
    }

    func testAttributeAtLocation_strokeWidth() {
        let str = "Hello".withStrokeWidth(2.2)
        let subject = str.swiftyAttribute(.strokeWidth, at: 0, effectiveRange: nil)!.value as! Double
        #if swift(>=4.0)
            let expected = str.attribute(.strokeWidth, at: 0, effectiveRange: nil) as! Double
        #else
            let expected = str.attribute(NSStrokeWidthAttributeName, at: 0, effectiveRange: nil) as! Double
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 2.2)
    }

    func testAttributeAtLocation_strikethroughColor() {
        let str = "Hello".withStrikethroughColor(.orange)
        let subject = str.swiftyAttribute(.strikethroughColor, at: 0, effectiveRange: nil)!.value as! Color
        #if swift(>=4.0)
            let expected = str.attribute(.strikethroughColor, at: 0, effectiveRange: nil) as! Color
        #else
            let expected = str.attribute(NSStrikethroughColorAttributeName, at: 0, effectiveRange: nil) as! Color
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .orange)
    }

    func testAttributeAtLocation_strikethroughStyle() {
        let str = "Hello".withStrikethroughStyle(.styleDouble)
        let subject = str.swiftyAttribute(.strikethroughStyle, at: 0, effectiveRange: nil)!.value as! StrikethroughStyle
        #if swift(>=4.0)
            let expected = str.attribute(.strikethroughStyle, at: 0, effectiveRange: nil) as! Int
        #else
            let expected = str.attribute(NSStrikethroughStyleAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .styleDouble)
    }

    func testAttributeAtLocation_textColor() {
        let str = "Hello".withTextColor(.green)
        let subject = str.swiftyAttribute(.foregroundColor, at: 0, effectiveRange: nil)!.value as! Color
        #if swift(>=4.0)
            let expected = str.attribute(.foregroundColor, at: 0, effectiveRange: nil) as! Color
        #else
            let expected = str.attribute(NSForegroundColorAttributeName, at: 0, effectiveRange: nil) as! Color
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .green)
    }

    func testAttributeAtLocation_textEffect() {
        let str = "Hello".withTextEffect(.letterPressStyle)
        let subject = str.swiftyAttribute(.textEffect, at: 0, effectiveRange: nil)!.value as! TextEffect
        #if swift(>=4.0)
            let expected = str.attribute(.textEffect, at: 0, effectiveRange: nil) as! String
        #else
            let expected = str.attribute(NSTextEffectAttributeName, at: 0, effectiveRange: nil) as! String
        #endif
        XCTAssertEqual(subject.rawValue, expected)
        #if swift(>=4.0)
            XCTAssertEqual(subject.rawValue, NSAttributedString.TextEffectStyle.letterpressStyle.rawValue)
        #else
            XCTAssertEqual(subject.rawValue, NSTextEffectLetterpressStyle)
        #endif
    }

    func testAttributeAtLocation_underlineColor() {
        let str = "Hello".withUnderlineColor(.blue)
        let subject = str.swiftyAttribute(.underlineColor, at: 0, effectiveRange: nil)!.value as! Color
        #if swift(>=4.0)
            let expected = str.attribute(.underlineColor, at: 0, effectiveRange: nil) as! Color
        #else
            let expected = str.attribute(NSUnderlineColorAttributeName, at: 0, effectiveRange: nil) as! Color
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, .blue)
    }

    func testAttributeAtLocation_underlineStyle() {
        let str = "Hello".withUnderlineStyle(.byWord)
        let subject = str.swiftyAttribute(.underlineStyle, at: 0, effectiveRange: nil)!.value as! UnderlineStyle
        #if swift(>=4.0)
            let expected = str.attribute(.underlineStyle, at: 0, effectiveRange: nil) as! Int
        #else
            let expected = str.attribute(NSUnderlineStyleAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .byWord)
    }

    func testAttributeAtLocation_verticalGlyphForm() {
        let str = "Hello".withVerticalGlyphForm(.horizontal)
        let subject = str.swiftyAttribute(.verticalGlyphForm, at: 0, effectiveRange: nil)!.value as! VerticalGlyphForm
        #if swift(>=4.0)
            let expected = str.attribute(.verticalGlyphForm, at: 0, effectiveRange: nil) as! Int
        #else
            let expected = str.attribute(NSVerticalGlyphFormAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .horizontal)
    }

    func testAttributeAtLocation_writingDirections() {
        let str = "Hello".withWritingDirections([.leftToRightOverride, .rightToLeftEmbedding])
        let subject = str.swiftyAttribute(.writingDirection, at: 0, effectiveRange: nil)!.value as! [WritingDirection]
        #if swift(>=4.0)
            let expected = str.attribute(.writingDirection, at: 0, effectiveRange: nil) as! [Int]
        #else
            let expected = str.attribute(NSWritingDirectionAttributeName, at: 0, effectiveRange: nil) as! [Int]
        #endif
        XCTAssertEqual(subject.map { $0.rawValue }, expected)
        XCTAssertFalse(subject.isEmpty)
    }

    func testAttributeAtLocation_custom() {
        let str = "Hello".withCustomAttribute(named: "Foo", value: "Bar")
        #if swift(>=4.0)
            let subject = str.swiftyAttribute(.init("Foo"), at: 0, effectiveRange: nil)!.value as! String
            let expected = str.attribute(.init("Foo"), at: 0, effectiveRange: nil) as! String
        #else
        let subject = str.swiftyAttribute(.custom("Foo"), at: 0, effectiveRange: nil)!.value as! String
            let expected = str.attribute("Foo", at: 0, effectiveRange: nil) as! String
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, "Bar")
    }

    func testAttributeAtLocation_noSuchAttribute() {
        let str = "Hello".withUnderlineColor(.magenta)
        let subject = str.swiftyAttribute(.backgroundColor, at: 0, effectiveRange: nil)
        #if swift(>=4.0)
            let expected = str.attribute(.backgroundColor, at: 0, effectiveRange: nil)
        #else
            let expected = str.attribute(NSBackgroundColorAttributeName, at: 0, effectiveRange: nil)
        #endif
        XCTAssertNil(subject)
        XCTAssertNil(expected)
    }

    func testAttributeAtLocation_effectiveRange_attributeNonNil() {
        let str = "Hello".withUnderlineStyle(.patternDot) + "World".withUnderlineColor(.magenta)
        var swiftyRange = NSRange()
        var foundationRange = NSRange()
        let subject = str.swiftyAttribute(.underlineStyle, at: 0, effectiveRange: &swiftyRange)!.value as! UnderlineStyle
        #if swift(>=4.0)
            let expected = str.attribute(.underlineStyle, at: 0, effectiveRange: &foundationRange) as! Int
        #else
            let expected = str.attribute(NSUnderlineStyleAttributeName, at: 0, effectiveRange: &foundationRange) as! Int
        #endif
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
        let subject = str.swiftyAttribute(.underlineStyle, at: 6, effectiveRange: &swiftyRange)
        #if swift(>=4.0)
            let expected = str.attribute(.underlineStyle, at: 6, effectiveRange: &foundationRange)
        #else
            let expected = str.attribute(NSUnderlineStyleAttributeName, at: 6, effectiveRange: &foundationRange)
        #endif
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
        let subject = str.swiftyAttribute(.cursor, at: 0, effectiveRange: nil)!.value as! Cursor
        #if swift(>=4.0)
            let expected = str.attribute(.cursor, at: 0, effectiveRange: nil) as! Cursor
        #else
            let expected = str.attribute(NSCursorAttributeName, at: 0, effectiveRange: nil) as! Cursor
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, cursor)
    }

    func testAttributeAtLocation_markedClauseSegment() {
        let str = "Hello".withMarkedClauseSegment(2)
        let subject = str.swiftyAttribute(.markedClauseSegment, at: 0, effectiveRange: nil)!.value as! Int
        #if swift(>=4.0)
            let expected = str.attribute(.markedClauseSegment, at: 0, effectiveRange: nil) as! Int
        #else
            let expected = str.attribute(NSMarkedClauseSegmentAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 2)
    }

    func testAttributeAtLocation_spellingState() {
        let str = "Hello".withSpellingState(.grammar)
        let subject = str.swiftyAttribute(.spellingState, at: 0, effectiveRange: nil)!.value as! SpellingState
        #if swift(>=4.0)
            let expected = str.attribute(.spellingState, at: 0, effectiveRange: nil) as! Int
        #else
            let expected = str.attribute(NSSpellingStateAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        XCTAssertEqual(subject.rawValue, expected)
        XCTAssertEqual(subject, .grammar)
    }

    func testAttributeAtLocation_superscript() {
        let str = "Hello".withSuperscript(3)
        let subject = str.swiftyAttribute(.superscript, at: 0, effectiveRange: nil)!.value as! Int
        #if swift(>=4.0)
            let expected = str.attribute(.superscript, at: 0, effectiveRange: nil) as! Int
        #else
            let expected = str.attribute(NSSuperscriptAttributeName, at: 0, effectiveRange: nil) as! Int
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, 3)
    }

    func testAttributeAtLocation_textAlternatives() {
        let alternatives = TextAlternatives(primaryString: "Hi", alternativeStrings: ["Sup", "Yo"])
        let str = "Hello".withTextAlternatives(alternatives)
        let subject = str.swiftyAttribute(.textAlternatives, at: 0, effectiveRange: nil)!.value as! TextAlternatives
        #if swift(>=4.0)
            let expected = str.attribute(.textAlternatives, at: 0, effectiveRange: nil) as! TextAlternatives
        #else
            let expected = str.attribute(NSTextAlternativesAttributeName, at: 0, effectiveRange: nil) as! TextAlternatives
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, alternatives)
    }

    func testAttributeAtLocation_toolTip() {
        let str = "Hello".withToolTip("Yo")
        let subject = str.swiftyAttribute(.toolTip, at: 0, effectiveRange: nil)!.value as! String
        #if swift(>=4.0)
            let expected = str.attribute(.toolTip, at: 0, effectiveRange: nil) as! String
        #else
            let expected = str.attribute(NSToolTipAttributeName, at: 0, effectiveRange: nil) as! String
        #endif
        XCTAssertEqual(subject, expected)
        XCTAssertEqual(subject, "Yo")
    }

    // MARK: - Font Attributes

    func testFontAttributes_onlyFontAttributes() {
        let subject = "Hello".withFont(.systemFont(ofSize: 19)).fontAttributes(in: 0 ..< 3).foundationAttributes
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.font
        #else
            let attributeName = NSFontAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: Font.systemFont(ofSize: 19)]).fontAttributes(in: NSRange(location: 0, length: 3))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.font(.systemFont(ofSize: 19))])
    }

    func testFontAttributes_includesNonFontAttributes() {
        let url = URL(string: "www.google.com")!
        let subject = "Hello".withAttributes([.font(.systemFont(ofSize: 19)), .link(url)]).fontAttributes(in: 0 ..< 3).foundationAttributes
        #if swift(>=4.0)
            let fontAttributeName = NSAttributedStringKey.font
            let linkAttributeName = NSAttributedStringKey.link
        #else
            let fontAttributeName = NSFontAttributeName
            let linkAttributeName = NSLinkAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [fontAttributeName: Font.systemFont(ofSize: 19), linkAttributeName: url]).fontAttributes(in: NSRange(location: 0, length: 3))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.font(.systemFont(ofSize: 19))])
    }

    // MARK: - Ruler Attributes

    func testRulerAttributes_onlyRulerAttributes() {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let subject = "Hello".withParagraphStyle(style).rulerAttributes(in: 1 ..< 3).foundationAttributes
        #if swift(>=4.0)
            let attributeName = NSAttributedStringKey.paragraphStyle
        #else
            let attributeName = NSParagraphStyleAttributeName
        #endif
        let expected = NSAttributedString(string: "Hello", attributes: [attributeName: style]).rulerAttributes(in: NSRange(location: 1, length: 2))
        XCTAssertEqual(subject as NSDictionary, expected as NSDictionary)
        XCTAssertEqual(subject.swiftyAttributes, [.paragraphStyle(style)])
    }

    #endif

    // MARK: Enumeration

    func testEnumerateSingleAttribute() {
        let str = "Hello".withExpansion(3) + "World".attributedString
        var enumerated = false
        str.enumerateSwiftyAttribute(.expansion, in: 0 ..< 7) { value, range, _ in
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

        #if swift(>=4.0)
            let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        #else
            let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }
        #endif

        var enumerated = false
        str.enumerateSwiftyAttributes(in: 3 ..< 15) { attrs, range, _ in
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
                XCTFail("Incorrect upper bound when enumerating attributes")
            }
        }

        XCTAssertTrue(enumerated)
    }

    func testEnumerate_stopValue() {
        let str = "Hello".withBackgroundColor(.blue) + "World".withKern(3) + "!".withTextColor(.magenta)
        var enumerations = 0
        str.enumerateSwiftyAttributes(in: 0 ..< str.length) { _, _, _ in
            enumerations += 1
        }
        XCTAssertEqual(enumerations, 3)
        enumerations = 0
        str.enumerateSwiftyAttributes(in: 0 ..< str.length) { _, _, stop in
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
        str.enumerateSwiftyAttribute(.expansion, in: 0 ..< 7, options: .reverse) { value, range, _ in
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

        #if swift(>=4.0)
            let sort: (Attribute, Attribute) -> Bool = { $0.keyName.rawValue < $1.keyName.rawValue }
        #else
            let sort: (Attribute, Attribute) -> Bool = { $0.0.keyName < $0.1.keyName }
        #endif

        let subject = str.swiftyAttributes(in: 3 ..< 15)
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
