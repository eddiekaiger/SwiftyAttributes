//
//  Attribute.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/15/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

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

    public var keyName: String {
        switch self {
        case .attachment(_): return NSAttachmentAttributeName
        case .baselineOffset(_): return NSBaselineOffsetAttributeName
        case .backgroundColor(_): return NSBackgroundColorAttributeName
        case .expansion(_): return NSExpansionAttributeName
        case .font(_): return NSFontAttributeName
        case .kern(_): return NSKernAttributeName
        case .ligatures(_): return NSLigatureAttributeName
        case .link(_): return NSLinkAttributeName
        case .obliqueness(_): return NSObliquenessAttributeName
        case .paragraphStyle(_): return NSParagraphStyleAttributeName
        case .shadow(_): return NSShadowAttributeName
        case .strokeColor(_): return NSStrokeColorAttributeName
        case .strokeWidth(_): return NSStrokeWidthAttributeName
        case .strikethroughColor(_): return NSStrikethroughColorAttributeName
        case .strikethroughStyle(_): return NSStrikethroughStyleAttributeName
        case .textColor(_): return NSForegroundColorAttributeName
        case .textEffect(_): return NSTextEffectAttributeName
        case .underlineColor(_): return NSUnderlineColorAttributeName
        case .underlineStyle(_): return NSUnderlineStyleAttributeName
        case .writingDirections(_): return NSWritingDirectionAttributeName
        }
    }

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
}

extension NSAttributedString {

    fileprivate func dictionary(from attributes: [Attribute]) -> [String: Any] {
        var dict = [String: Any]()
        for attr in attributes {
            dict[attr.keyName] = attr.value
        }
        return dict
    }

    public func withAttributes(_ attributes: [Attribute]) -> NSMutableAttributedString {
        let mutable = mutableCopy() as! NSMutableAttributedString
        mutable.addAttributes(dictionary(from: attributes), range: NSRange(location: 0, length: length))
        return mutable
    }

    public func withAttribute(_ attribute: Attribute) -> NSMutableAttributedString {
        return withAttributes([attribute])
    }

}

extension NSMutableAttributedString {

    public func addAttributes(_ attributes: [Attribute], range: Range<Int>) {
        addAttributes(dictionary(from: attributes), range: NSRange(location: range.lowerBound, length: range.count))
    }

}
