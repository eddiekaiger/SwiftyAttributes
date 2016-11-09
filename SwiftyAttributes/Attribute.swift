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

    /// A value indicating the skew to be applied to glyphs.
    case obliqueness(Double)

    /// An `NSParagraphStyle` to be applied to the attributed string.
    case paragraphStyle(ParagraphStyle)

    #if os(watchOS)
    #else
    /// A shadow to be applied to the characters.
    case shadow(Shadow)
    #endif

    /// The color of the stroke (border) around the characters.
    case strokeColor(Color)

    /// The width/thickness of the stroke (border) around the characters.
    case strokeWidth(Double)

    /// The color of the strikethrough.
    case strikethroughColor(Color)

    /// The style of the strikethrough.
    case strikethroughStyle(StrikethroughStyle)

    /// The text color.
    case textColor(Color)

    /// The text effect to apply. See `TextEffect` for possible values.
    case textEffect(TextEffect)

    /// The color of the underline.
    case underlineColor(Color)

    /// The style of the underline.
    case underlineStyle(UnderlineStyle)

    /// The writing directions to apply to the attributed string. See `WritingDirection` for values. Only available on iOS 9.0+.
    case writingDirections([WritingDirection])

    init!(name: Attribute.Name, value: Any) {
        func validate<Type>(_ val: Any) -> Type {
            return val as! Type
        }

        // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)
        #if os(watchOS)
        #else
            switch name {
            case .attachment:
                self = .attachment(validate(value))
                return
            case .shadow:
                self = .shadow(validate(value))
                return
            default: break
            }
        #endif
        switch name {
        case .baselineOffset: self = .baselineOffset(validate(value))
        case .backgroundColor: self = .backgroundColor(validate(value))
        case .expansion: self = .expansion(validate(value))
        case .font: self = .font(validate(value))
        case .kern: self = .kern(validate(value))
        case .ligature: self = .ligatures(validate(value))
        case .link: self = .link(validate(value))
        case .obliqueness: self = .obliqueness(validate(value))
        case .paragraphStyle: self = .paragraphStyle(validate(value))
        case .strokeColor: self = .strokeColor(validate(value))
        case .strokeWidth: self = .strokeWidth(validate(value))
        case .strikethroughColor: self = .strikethroughColor(validate(value))
        case .strikethroughStyle: self = .strikethroughStyle(validate(value))
        case .textColor: self = .textColor(validate(value))
        case .textEffect: self = .textEffect(validate(value))
        case .underlineColor: self = .underlineColor(validate(value))
        case .underlineStyle: self = .underlineStyle(validate(value))
        case .writingDirection: self = .writingDirections(validate(value))
        default: return nil
        }
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
        case .writingDirections(let directions): ret = directions
        default: break
        }
        return ret
    }

    var foundationValue: Any {
        switch self {
        case .ligatures(let ligatures): return ligatures.rawValue
        case .strikethroughStyle(let style): return NSNumber(value: style.rawValue)
        case .textEffect(let effect): return effect.rawValue
        case .underlineStyle(let style): return NSNumber(value: style.rawValue)
        case .writingDirections(let directions): return directions.map { $0.rawValue }
        default: return value
        }
    }

    /**
     An enum that corresponds to `Attribute`, mapping attributes to their respective names.
    */
    public enum Name: RawRepresentable {
        #if os(watchOS)
        #else
        case attachment
        #endif
        case baselineOffset
        case backgroundColor
        case expansion
        case font
        case kern
        case ligature
        case link
        case obliqueness
        case paragraphStyle
        #if os(watchOS)
        #else
        case shadow
        #endif
        case strokeColor
        case strokeWidth
        case strikethroughColor
        case strikethroughStyle
        case textColor
        case textEffect
        case underlineColor
        case underlineStyle
        case writingDirection

        public init?(rawValue: String) {
            switch rawValue {
            case NSAttachmentAttributeName:
                #if os(watchOS)
                    return nil
                #else
                    self = .attachment
                    return
                #endif
            case NSBaselineOffsetAttributeName: self = .baselineOffset
            case NSBackgroundColorAttributeName: self = .backgroundColor
            case NSExpansionAttributeName: self = .expansion
            case NSFontAttributeName: self = .font
            case NSKernAttributeName: self = .kern
            case NSLigatureAttributeName: self = .ligature
            case NSLinkAttributeName: self = .link
            case NSObliquenessAttributeName: self = .obliqueness
            case NSParagraphStyleAttributeName: self = .paragraphStyle
            case NSShadowAttributeName:
                #if os(watchOS)
                    return nil
                #else
                    self = .shadow
                    return
                #endif
            case NSStrokeColorAttributeName: self = .strokeColor
            case NSStrokeWidthAttributeName: self = .strokeWidth
            case NSStrikethroughColorAttributeName: self = .strikethroughColor
            case NSStrikethroughStyleAttributeName: self = .strikethroughStyle
            case NSForegroundColorAttributeName: self = .textColor
            case NSTextEffectAttributeName: self = .textEffect
            case NSUnderlineColorAttributeName: self = .underlineColor
            case NSUnderlineStyleAttributeName: self = .underlineStyle
            case NSWritingDirectionAttributeName: self = .writingDirection
            default: return nil
            }
        }

        public var rawValue: String {
            var name: String!
            // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)
            #if os(watchOS)
            #else
                switch self {
                case .attachment: name = NSAttachmentAttributeName
                case .shadow: name = NSShadowAttributeName
                default: break
                }
            #endif
            switch self {
            case .baselineOffset: name = NSBaselineOffsetAttributeName
            case .backgroundColor: name = NSBackgroundColorAttributeName
            case .expansion: name = NSExpansionAttributeName
            case .font: name = NSFontAttributeName
            case .kern: name = NSKernAttributeName
            case .ligature: name = NSLigatureAttributeName
            case .link: name = NSLinkAttributeName
            case .obliqueness: name = NSObliquenessAttributeName
            case .paragraphStyle: name = NSParagraphStyleAttributeName
            case .strokeColor: name = NSStrokeColorAttributeName
            case .strokeWidth: name = NSStrokeWidthAttributeName
            case .strikethroughColor: name = NSStrikethroughColorAttributeName
            case .strikethroughStyle: name = NSStrikethroughStyleAttributeName
            case .textColor: name = NSForegroundColorAttributeName
            case .textEffect: name = NSTextEffectAttributeName
            case .underlineColor: name = NSUnderlineColorAttributeName
            case .underlineStyle: name = NSUnderlineStyleAttributeName
            case .writingDirection: name = NSWritingDirectionAttributeName
            default: break
            }
            return name
        }
    }
}
