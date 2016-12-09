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

    init(name: Attribute.Name, foundationValue: Any) {
        func validate<Type>(_ val: Any) -> Type {
            assert(val is Type, "Attribute with name \(name.rawValue) must have a value of type \(Type.self)")
            return val as! Type
        }

        func validateDouble(_ val: Any) -> Double {
            assert(val is NSNumber, "Attribute with name \(name.rawValue) must have a value that is castable to NSNumber")
            return (val as! NSNumber).doubleValue
        }

        var ret: Attribute!

        // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)

        #if os(watchOS)
        #else
            switch name {
            case .attachment: ret = .attachment(validate(foundationValue))
            case .shadow: ret = .shadow(validate(foundationValue))
            default: break
            }
        #endif

        #if os(macOS)
            switch name {
            case .cursor: ret = .cursor(validate(foundationValue))
            case .markedClauseSegment: ret = .markedClauseSegment(validate(foundationValue))
            case .spellingState: ret = .spellingState(SpellingState(rawValue: validate(foundationValue))!)
            case .superscript: ret = .superscript(validate(foundationValue))
            case .textAlternatives: ret = .textAlternatives(validate(foundationValue))
            case .toolTip: ret = .toolTip(validate(foundationValue))
            default: break
            }
        #endif

        switch name {
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
        case .strikethroughStyle: ret = .strikethroughStyle(StrikethroughStyle(rawValue: validate(foundationValue))!)
        case .textColor: ret = .textColor(validate(foundationValue))
        case .textEffect: ret = .textEffect(TextEffect(rawValue: validate(foundationValue))!)
        case .underlineColor: ret = .underlineColor(validate(foundationValue))
        case .underlineStyle: ret = .underlineStyle(UnderlineStyle(rawValue: validate(foundationValue))!)
        case .verticalGlyphForm: ret = .verticalGlyphForm(VerticalGlyphForm(rawValue: validate(foundationValue))!)
        case .writingDirection:
            let values: [Int] = validate(foundationValue)
            ret = .writingDirections(values.flatMap(WritingDirection.init))
        default: break
        }

        self = ret
    }

    /// The key name corresponding to the attribute.
    public var keyName: String {

        var name: Attribute.Name!

        // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)

        #if os(watchOS)
        #else
            switch self {
            case .attachment(_): name = .attachment
            case .shadow(_): name = .shadow
            default: break
            }
        #endif

        #if os(macOS)
            switch self {
            case .cursor(_): name = .cursor
            case .markedClauseSegment(_): name = .markedClauseSegment
            case .spellingState(_): name = .spellingState
            case .superscript(_): name = .superscript
            case .textAlternatives(_): name = .textAlternatives
            case .toolTip(_): name = .toolTip
            default: break
            }
        #endif

        switch self {
        case .baselineOffset(_): name = .baselineOffset
        case .backgroundColor(_): name = .backgroundColor
        case .expansion(_): name = .expansion
        case .font(_): name = .font
        case .kern(_): name = .kern
        case .ligatures(_): name = .ligature
        case .link(_): name = .link
        case .obliqueness(_): name = .obliqueness
        case .paragraphStyle(_): name = .paragraphStyle
        case .strokeColor(_): name = .strokeColor
        case .strokeWidth(_): name = .strokeWidth
        case .strikethroughColor(_): name = .strikethroughColor
        case .strikethroughStyle(_): name = .strikethroughStyle
        case .textColor(_): name = .textColor
        case .textEffect(_): name = .textEffect
        case .underlineColor(_): name = .underlineColor
        case .underlineStyle(_): name = .underlineStyle
        case .writingDirections(_): name = .writingDirection
        case .verticalGlyphForm(_): name = .verticalGlyphForm
        default: break
        }

        return name.rawValue
    }

    // Convenience getter variable for the associated value of the attribute. See each case to determine the return type.
    public var value: Any {

        var ret: Any!

        // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)

        #if os(watchOS)
        #else
            switch self {
            case .attachment(let attachment): ret = attachment
            case .shadow(let shadow): ret = shadow
            default: break
            }
        #endif

        #if os(macOS)
            switch self {
            case .cursor(let cursor): ret = cursor
            case .markedClauseSegment(let segment): ret = segment
            case .spellingState(let state): ret = state
            case .superscript(let superscript): ret = superscript
            case .textAlternatives(let alternatives): ret = alternatives
            case .toolTip(let text): ret = text
            default: break
            }
        #endif

        switch self {
        case .baselineOffset(let offset): ret = offset
        case .backgroundColor(let color): ret = color
        case .expansion(let expansion): ret = expansion
        case .font(let font): ret = font
        case .kern(let kern): ret = kern
        case .ligatures(let ligatures): ret = ligatures
        case .link(let link): ret = link
        case .obliqueness(let value): ret = value
        case .paragraphStyle(let style): ret = style
        case .strokeColor(let color): ret = color
        case .strokeWidth(let width): ret = width
        case .strikethroughColor(let color): ret = color
        case .strikethroughStyle(let style): ret = style
        case .textColor(let color): ret = color
        case .textEffect(let effect): ret = effect
        case .underlineColor(let color): ret = color
        case .underlineStyle(let style): ret = style
        case .verticalGlyphForm(let form): ret = form
        case .writingDirections(let directions): ret = directions
        default: break
        }

        return ret
    }

    /// The value that is passed into the original attribute dictionary of Foundation's API for NSAttributedStrings. Consists of basic types such as Int, Color, Font, etc.
    public var foundationValue: Any {
        #if os(macOS)
            switch self {
            case .spellingState(let state): return state.rawValue
            default: break
            }
        #endif

        switch self {
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
