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

        public init?(rawValue: NSAttributedStringKey) {

            #if os(macOS)
                switch rawValue {
                case .cursor:
                    self = .cursor
                    return
                case .markedClauseSegment:
                    self = .markedClauseSegment
                    return
                case .spellingState:
                    self = .spellingState
                    return
                case .superscript:
                    self = .superscript
                    return
                case .textAlternatives:
                    self = .textAlternatives
                    return
                case .toolTip:
                    self = .toolTip
                    return
                default: break
                }
            #endif

            switch rawValue {
            case .attachment:
                #if os(watchOS)
                    return nil
                #else
                    self = .attachment
                #endif
            case .baselineOffset: self = .baselineOffset
            case .backgroundColor: self = .backgroundColor
            case .expansion: self = .expansion
            case .font: self = .font
            case .kern: self = .kern
            case .ligature: self = .ligature
            case .link: self = .link
            case .obliqueness: self = .obliqueness
            case .paragraphStyle: self = .paragraphStyle
            case .shadow:
                #if os(watchOS)
                    return nil
                #else
                    self = .shadow
                #endif
            case .strokeColor: self = .strokeColor
            case .strokeWidth: self = .strokeWidth
            case .strikethroughColor: self = .strikethroughColor
            case .strikethroughStyle: self = .strikethroughStyle
            case .foregroundColor: self = .textColor
            case .textEffect: self = .textEffect
            case .underlineColor: self = .underlineColor
            case .underlineStyle: self = .underlineStyle
            case .verticalGlyphForm: self = .verticalGlyphForm
            case .writingDirection: self = .writingDirection
            default: return nil
            }
        }

        public var rawValue: NSAttributedStringKey {

            var name: NSAttributedStringKey!

            // Bug in Swift prevents us from putting directives inside switch statements (https://bugs.swift.org/browse/SR-2)

            #if os(watchOS)
            #else
                switch self {
                case .attachment: name = .attachment
                case .shadow: name = .shadow
                default: break
                }
            #endif

            #if os(macOS)
                switch self {
                case .cursor: name = .cursor
                case .markedClauseSegment: name = .markedClauseSegment
                case .spellingState: name = .spellingState
                case .superscript: name = .superscript
                case .textAlternatives: name = .textAlternatives
                case .toolTip: name = .toolTip
                default: break
                }
            #endif

            switch self {
            case .baselineOffset: name = .baselineOffset
            case .backgroundColor: name = .backgroundColor
            case .expansion: name = .expansion
            case .font: name = .font
            case .kern: name = .kern
            case .ligature: name = .ligature
            case .link: name = .link
            case .obliqueness: name = .obliqueness
            case .paragraphStyle: name = .paragraphStyle
            case .strokeColor: name = .strokeColor
            case .strokeWidth: name =                   .strokeWidth
            case .strikethroughColor: name = .strikethroughColor
            case .strikethroughStyle: name = .strikethroughStyle
            case .textColor: name = .foregroundColor
            case .textEffect: name = .textEffect
            case .underlineColor: name = .underlineColor
            case .underlineStyle: name = .underlineStyle
            case .verticalGlyphForm: name = .verticalGlyphForm
            case .writingDirection: name = .writingDirection
            default: break
            }
            
            return name
        }
    }

}
