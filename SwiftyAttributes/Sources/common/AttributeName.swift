//
//  AttributeName.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/23/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

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
        case textColor
        case textEffect
        #if os(macOS)
        case toolTip
        #endif
        case underlineColor
        case underlineStyle
        case verticalGlyphForm
        case writingDirection

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
            case NSForegroundColorAttributeName: self = .textColor
            case NSTextEffectAttributeName: self = .textEffect
            case NSUnderlineColorAttributeName: self = .underlineColor
            case NSUnderlineStyleAttributeName: self = .underlineStyle
            case NSVerticalGlyphFormAttributeName: self = .verticalGlyphForm
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

            #if os(macOS)
                switch self {
                case .cursor: name = NSCursorAttributeName
                case .markedClauseSegment: name = NSMarkedClauseSegmentAttributeName
                case .spellingState: name = NSSpellingStateAttributeName
                case .superscript: name = NSSuperscriptAttributeName
                case .textAlternatives: name = NSTextAlternativesAttributeName
                case .toolTip: name = NSToolTipAttributeName
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
            case .verticalGlyphForm: name = NSVerticalGlyphFormAttributeName
            case .writingDirection: name = NSWritingDirectionAttributeName
            default: break
            }
            
            return name
        }
    }

}
