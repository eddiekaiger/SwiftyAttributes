//
//  Attribute.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/15/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

private let attributeNames: [Attribute.Name: String] = [
    .attachment: NSAttachmentAttributeName,
    .baselineOffset: NSBaselineOffsetAttributeName,
    .backgroundColor: NSBackgroundColorAttributeName,
    .expansion: NSExpansionAttributeName,
    .font: NSFontAttributeName,
    .kern: NSKernAttributeName,
    .ligature: NSLigatureAttributeName,
    .link: NSLinkAttributeName,
    .obliqueness: NSObliquenessAttributeName,
    .paragraphStyle: NSParagraphStyleAttributeName,
    .shadow: NSShadowAttributeName,
    .strokeColor: NSStrokeColorAttributeName,
    .strokeWidth: NSStrokeWidthAttributeName,
    .strikethroughColor: NSStrikethroughColorAttributeName,
    .strikethroughStyle: NSStrikethroughStyleAttributeName,
    .textColor: NSForegroundColorAttributeName,
    .textEffect: NSTextEffectAttributeName,
    .underlineColor: NSUnderlineColorAttributeName,
    .underlineStyle: NSUnderlineStyleAttributeName,
    .writingDirection: NSWritingDirectionAttributeName
]

/**
 Represents attributes that can be applied to NSAttributedStrings.
 */
public enum Attribute {
    case attachment(NSTextAttachment)
    case baselineOffset(Double)
    case backgroundColor(UIColor)
    case expansion(Double)
    case font(UIFont)
    case kern(Double)
    case ligatures(Ligatures)
    case link(URL)
    case obliqueness(Double)
    case paragraphStyle(NSParagraphStyle)
    case shadow(NSShadow)
    case strokeColor(UIColor)
    case strokeWidth(Double)
    case strikethroughColor(UIColor)
    case strikethroughStyle(NSUnderlineStyle)
    case textColor(UIColor)
    case textEffect(String)
    case underlineColor(UIColor)
    case underlineStyle(NSUnderlineStyle)
    case writingDirections([WritingDirection])

    /// The key name corresponding to the attribute.
    public var keyName: String {
        let name: Attribute.Name
        switch self {
        case .attachment(_): name = .attachment
        case .baselineOffset(_): name = .baselineOffset
        case .backgroundColor(_): name = .backgroundColor
        case .expansion(_): name = .expansion
        case .font(_): name = .font
        case .kern(_): name = .kern
        case .ligatures(_): name = .ligature
        case .link(_): name = .link
        case .obliqueness(_): name = .obliqueness
        case .paragraphStyle(_): name = .paragraphStyle
        case .shadow(_): name = .shadow
        case .strokeColor(_): name = .strokeColor
        case .strokeWidth(_): name = .strokeWidth
        case .strikethroughColor(_): name = .strikethroughColor
        case .strikethroughStyle(_): name = .strikethroughStyle
        case .textColor(_): name = .textColor
        case .textEffect(_): name = .textEffect
        case .underlineColor(_): name = .underlineColor
        case .underlineStyle(_): name = .underlineStyle
        case .writingDirections(_): name = .writingDirection
        }
        return name.rawValue
    }

    /// The actual value of the attribute, such as the color or style.
    public var value: Any {
        switch self {
        case .attachment(let attachment): return attachment
        case .baselineOffset(let offset): return offset
        case .backgroundColor(let color): return color
        case .expansion(let expansion): return expansion
        case .font(let font): return font
        case .kern(let kern): return kern
        case .ligatures(let ligatures): return ligatures.rawValue
        case .link(let link): return link
        case .obliqueness(let value): return value
        case .paragraphStyle(let style): return style
        case .shadow(let shadow): return shadow
        case .strokeColor(let color): return color
        case .strokeWidth(let width): return width
        case .strikethroughColor(let color): return color
        case .strikethroughStyle(let style): return NSNumber(value: style.rawValue)
        case .textColor(let color): return color
        case .textEffect(let effect): return effect
        case .underlineColor(let color): return color
        case .underlineStyle(let style): return NSNumber(value: style.rawValue)
        case .writingDirections(let directions): return directions.map { $0.rawValue }
        }
    }

    public enum Name: RawRepresentable {
        case attachment
        case baselineOffset
        case backgroundColor
        case expansion
        case font
        case kern
        case ligature
        case link
        case obliqueness
        case paragraphStyle
        case shadow
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
            for (key, val) in attributeNames {
                if val == rawValue {
                    self = key
                    return
                }
            }
            return nil
        }

        public var rawValue: String {
            return attributeNames[self]!
        }
    }
}
