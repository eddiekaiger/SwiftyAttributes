//
//  Attribute.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/15/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

#if os(macOS)
    import AppKit
    public typealias Color = NSColor
    public typealias Font = NSFont
    public typealias Cursor = NSCursor
    public typealias TextAlternatives = NSTextAlternatives
#else
    import UIKit
    public typealias Color = UIColor
    public typealias Font = UIFont
#endif

public typealias UnderlineStyle = NSUnderlineStyle
public typealias StrikethroughStyle = NSUnderlineStyle
public typealias ParagraphStyle = NSParagraphStyle

#if os(watchOS)
#else
    public typealias Shadow = NSShadow
    public typealias TextAttachment = NSTextAttachment
#endif

/**
 Represents attributes that can be applied to NSAttributedStrings.
 */
public enum Attribute {

    #if os(watchOS)
    #else
    /// Attachment attribute that allows items like images to be inserted into text.
    case attachment(TextAttachment)
    #endif

    /// Value indicating the character's offset from the baseline, in points.
    case baselineOffset(Double)

    /// The background color of the attributed string.
    case backgroundColor(Color)

    #if os(macOS)
    /// The cursor object associated with the attributed string.
    case cursor(Cursor)
    #endif

    /// Value indicating the log of the expansion factor to be applied to glyphs.
    case expansion(Double)

    /// The font of the attributed string.
    case font(Font)

    /// Specifies the number of points by which to adjust kern-pair characters. Kerning prevents unwanted space from occurring between specific characters and depends on the font. The value 0 means kerning is disabled (default).
    case kern(Double)

    /// Ligatures cause specific character combinations to be rendered using a single custom glyph that corresponds to those characters. See `Ligatures` for values.
    case ligatures(Ligatures)

    /// A URL link to attach to the attributed string.
    case link(URL)

    #if os(macOS)
    /// The index in marked text indicating clause segments.
    case markedClauseSegment(Int)
    #endif

    /// A value indicating the skew to be applied to glyphs.
    case obliqueness(Double)

    /// An `NSParagraphStyle` to be applied to the attributed string.
    case paragraphStyle(ParagraphStyle)

    #if os(watchOS)
    #else
    /// A shadow to be applied to the characters.
    case shadow(Shadow)
    #endif

    #if os(macOS)
    /// A state indicating a spelling or grammar error. See `SpellingState` for possible values.
    case spellingState(SpellingState)
    #endif

    /// The color of the stroke (border) around the characters.
    case strokeColor(Color)

    /// The width/thickness of the stroke (border) around the characters.
    case strokeWidth(Double)

    /// The color of the strikethrough.
    case strikethroughColor(Color)

    /// The style of the strikethrough.
    case strikethroughStyle(StrikethroughStyle)

    #if os(macOS)
    /// The superscript attribute.
    case superscript(Int)

    /// The object representing alternatives for a string that may be presented to the user.
    case textAlternatives(TextAlternatives)
    #endif

    /// The text color.
    case textColor(Color)

    /// The text effect to apply. See `TextEffect` for possible values.
    case textEffect(TextEffect)

    #if os(macOS)
    /// The text of the tooltip.
    case toolTip(String)
    #endif

    /// The color of the underline.
    case underlineColor(Color)

    /// The style of the underline.
    case underlineStyle(UnderlineStyle)

    /// The vertical glyph form (horizontal or vertical text). See `VerticalGlyphForm` for details.
    case verticalGlyphForm(VerticalGlyphForm)

    /// The writing directions to apply to the attributed string. See `WritingDirection` for values. Only available on iOS 9.0+.
    case writingDirections([WritingDirection])

    /// A custom attribute with a given attribute name and value.
    case custom(String, Any)

    init(name: NSAttributedString.Key, foundationValue: Any) {
        func validate<Type>(_ val: Any) -> Type {
            assert(val is Type, "Attribute with name \(name.rawValue) must have a value of type \(Type.self)")
            return val as! Type
        }

        func validateDouble(_ val: Any) -> Double {
            assert(val is NSNumber, "Attribute with name \(name.rawValue) must have a value that is castable to NSNumber")
            return (val as! NSNumber).doubleValue
        }

        let ret: Attribute

        switch name {
        #if !os(watchOS)
            case .attachment: ret = .attachment(validate(foundationValue))
            case .shadow: ret = .shadow(validate(foundationValue))
        #endif
        #if os(macOS)
            case .cursor: ret = .cursor(validate(foundationValue))
            case .markedClauseSegment: ret = .markedClauseSegment(validate(foundationValue))
            case .spellingState: ret = .spellingState(SpellingState(rawValue: validate(foundationValue))!)
            case .superscript: ret = .superscript(validate(foundationValue))
            case .textAlternatives: ret = .textAlternatives(validate(foundationValue))
            case .toolTip: ret = .toolTip(validate(foundationValue))
        #endif
        case .baselineOffset: ret = .baselineOffset(validateDouble(foundationValue))
        case .backgroundColor: ret = .backgroundColor(validate(foundationValue))
        case .expansion: ret = .expansion(validateDouble(foundationValue))
        case .font: ret = .font(validate(foundationValue))
        case .kern: ret = .kern(validateDouble(foundationValue))
        case .ligature: ret = .ligatures(Ligatures(rawValue: validate(foundationValue))!)
        case .link: ret = .link(validate(foundationValue))
        case .obliqueness: ret = .obliqueness(validateDouble(foundationValue))
        case .paragraphStyle: ret = .paragraphStyle(validate(foundationValue))
        case .strokeColor: ret = .strokeColor(validate(foundationValue))
        case .strokeWidth: ret = .strokeWidth(validateDouble(foundationValue))
        case .strikethroughColor: ret = .strikethroughColor(validate(foundationValue))
        case .strikethroughStyle: ret = .strikethroughStyle(StrikethroughStyle(rawValue: validate(foundationValue)))
        case .foregroundColor: ret = .textColor(validate(foundationValue))
        case .textEffect: ret = .textEffect(TextEffect(rawValue: validate(foundationValue))!)
        case .underlineColor: ret = .underlineColor(validate(foundationValue))
        case .underlineStyle: ret = .underlineStyle(UnderlineStyle(rawValue: validate(foundationValue)))
        case .verticalGlyphForm: ret = .verticalGlyphForm(VerticalGlyphForm(rawValue: validate(foundationValue))!)
        case .writingDirection:
            let values: [Int] = validate(foundationValue)
            ret = .writingDirections(values.compactMap(WritingDirection.init))
        default:
            ret = .custom(name.rawValue, foundationValue)
        }

        self = ret
    }

    /// The key name corresponding to the attribute.
    public var keyName: NSAttributedString.Key {
        let name: NSAttributedString.Key

        switch self {
        #if !os(watchOS)
            case .attachment: name = .attachment
            case .shadow: name = .shadow
        #endif
        #if os(macOS)
            case .cursor: name = .cursor
            case .markedClauseSegment: name = .markedClauseSegment
            case .spellingState: name = .spellingState
            case .superscript: name = .superscript
            case .textAlternatives: name = .textAlternatives
            case .toolTip: name = .toolTip
        #endif
        case .baselineOffset: name = .baselineOffset
        case .backgroundColor: name = .backgroundColor
        case .expansion: name = .expansion
        case .font: name = .font
        case .kern: name = .kern
        case .ligatures: name = .ligature
        case .link: name = .link
        case .obliqueness: name = .obliqueness
        case .paragraphStyle: name = .paragraphStyle
        case .strokeColor: name = .strokeColor
        case .strokeWidth: name = .strokeWidth
        case .strikethroughColor: name = .strikethroughColor
        case .strikethroughStyle: name = .strikethroughStyle
        case .textColor: name = .foregroundColor
        case .textEffect: name = .textEffect
        case .underlineColor: name = .underlineColor
        case .underlineStyle: name = .underlineStyle
        case .writingDirections: name = .writingDirection
        case .verticalGlyphForm: name = .verticalGlyphForm
        case .custom(let attributeName, _):
            name = NSAttributedString.Key(rawValue: attributeName)
        }

        return name
    }

    // Convenience getter variable for the associated value of the attribute. See each case to determine the return type.
    public var value: Any {

        switch self {
        #if !os(watchOS)
            case .attachment(let attachment): return attachment
            case .shadow(let shadow): return shadow
        #endif
        #if os(macOS)
            case .cursor(let cursor): return cursor
            case .markedClauseSegment(let segment): return segment
            case .spellingState(let state): return state
            case .superscript(let superscript): return superscript
            case .textAlternatives(let alternatives): return alternatives
            case .toolTip(let text): return text
        #endif
        case .baselineOffset(let offset): return offset
        case .backgroundColor(let color): return color
        case .expansion(let expansion): return expansion
        case .font(let font): return font
        case .kern(let kern): return kern
        case .ligatures(let ligatures): return ligatures
        case .link(let link): return link
        case .obliqueness(let value): return value
        case .paragraphStyle(let style): return style
        case .strokeColor(let color): return color
        case .strokeWidth(let width): return width
        case .strikethroughColor(let color): return color
        case .strikethroughStyle(let style): return style
        case .textColor(let color): return color
        case .textEffect(let effect): return effect
        case .underlineColor(let color): return color
        case .underlineStyle(let style): return style
        case .verticalGlyphForm(let form): return form
        case .writingDirections(let directions): return directions
        case .custom(_, let value): return value
        }
    }

    /// The value that is passed into the original attribute dictionary of Foundation's API for NSAttributedStrings. Consists of basic types such as Int, Color, Font, etc.
    public var foundationValue: Any {
        switch self {
        #if os(macOS)
            case .spellingState(let state): return state.rawValue
        #endif
        case .ligatures(let ligatures): return ligatures.rawValue
        case .strikethroughStyle(let style): return style.rawValue
        case .textEffect(let effect): return effect.rawValue
        case .underlineStyle(let style): return style.rawValue
        case .writingDirections(let directions): return directions.map { $0.rawValue }
        case .verticalGlyphForm(let form): return form.rawValue
        default: return value
        }
    }
}

extension Attribute: Equatable { }

public func == (lhs: Attribute, rhs: Attribute) -> Bool {
    return (lhs.foundationValue as? NSObject) == (rhs.foundationValue as? NSObject)
}
