//
//  AttributeName.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/23/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

#if swift(>=4.0)
#else

#if os(macOS)
    import AppKit
#else
    import UIKit
#endif

extension Attribute {

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
        #if os(macOS)
        case cursor
        #endif
        case expansion
        case font
        case kern
        case ligature
        case link
        #if os(macOS)
        case markedClauseSegment
        #endif
        case obliqueness
        case paragraphStyle
        #if os(watchOS)
        #else
        case shadow
        #endif
        #if os(macOS)
        case spellingState
        #endif
        case strokeColor
        case strokeWidth
        case strikethroughColor
        case strikethroughStyle
        #if os(macOS)
        case superscript
        case textAlternatives
        #endif
        case foregroundColor
        case textEffect
        #if os(macOS)
        case toolTip
        #endif
        case underlineColor
        case underlineStyle
        case verticalGlyphForm
        case writingDirection
        case custom(String)

        public init?(rawValue: String) {

            #if os(macOS)
                switch rawValue {
                case NSCursorAttributeName:
                    self = .cursor
                    return
                case NSMarkedClauseSegmentAttributeName:
                    self = .markedClauseSegment
                    return
                case NSSpellingStateAttributeName:
                    self = .spellingState
                    return
                case NSSuperscriptAttributeName:
                    self = .superscript
                    return
                case NSTextAlternativesAttributeName:
                    self = .textAlternatives
                    return
                case NSToolTipAttributeName:
                    self = .toolTip
                    return
                default: break
                }
            #endif

            switch rawValue {
            case NSAttachmentAttributeName:
                #if os(watchOS)
                    return nil
                #else
                    self = .attachment
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
                #endif
            case NSStrokeColorAttributeName: self = .strokeColor
            case NSStrokeWidthAttributeName: self = .strokeWidth
            case NSStrikethroughColorAttributeName: self = .strikethroughColor
            case NSStrikethroughStyleAttributeName: self = .strikethroughStyle
            case NSForegroundColorAttributeName: self = .foregroundColor
            case NSTextEffectAttributeName: self = .textEffect
            case NSUnderlineColorAttributeName: self = .underlineColor
            case NSUnderlineStyleAttributeName: self = .underlineStyle
            case NSVerticalGlyphFormAttributeName: self = .verticalGlyphForm
            case NSWritingDirectionAttributeName: self = .writingDirection
            default: self = .custom(rawValue)
            }
        }

        public var rawValue: String {

            // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)

            #if os(watchOS)
            #else
                switch self {
                case .attachment: return NSAttachmentAttributeName
                case .shadow: return NSShadowAttributeName
                default: break
                }
            #endif

            #if os(macOS)
                switch self {
                case .cursor: return NSCursorAttributeName
                case .markedClauseSegment: return NSMarkedClauseSegmentAttributeName
                case .spellingState: return NSSpellingStateAttributeName
                case .superscript: return NSSuperscriptAttributeName
                case .textAlternatives: return NSTextAlternativesAttributeName
                case .toolTip: return NSToolTipAttributeName
                default: break
                }
            #endif

            switch self {
            case .baselineOffset: return NSBaselineOffsetAttributeName
            case .backgroundColor: return NSBackgroundColorAttributeName
            case .expansion: return NSExpansionAttributeName
            case .font: return NSFontAttributeName
            case .kern: return NSKernAttributeName
            case .ligature: return NSLigatureAttributeName
            case .link: return NSLinkAttributeName
            case .obliqueness: return NSObliquenessAttributeName
            case .paragraphStyle: return NSParagraphStyleAttributeName
            case .strokeColor: return NSStrokeColorAttributeName
            case .strokeWidth: return NSStrokeWidthAttributeName
            case .strikethroughColor: return NSStrikethroughColorAttributeName
            case .strikethroughStyle: return NSStrikethroughStyleAttributeName
            case .foregroundColor: return NSForegroundColorAttributeName
            case .textEffect: return NSTextEffectAttributeName
            case .underlineColor: return NSUnderlineColorAttributeName
            case .underlineStyle: return NSUnderlineStyleAttributeName
            case .verticalGlyphForm: return NSVerticalGlyphFormAttributeName
            case .writingDirection: return NSWritingDirectionAttributeName
            case .custom(let name): return name
            default:
                fatalError("Unhandled attribute name: \(self)")
            }
        }
    }

}

extension Attribute.Name: Equatable {

    public static func ==(lhs: Attribute.Name, rhs: Attribute.Name) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

}

#endif
