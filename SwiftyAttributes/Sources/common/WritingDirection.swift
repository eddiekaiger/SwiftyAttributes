//
//  WritingDirection.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/5/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

#if os(macOS)
    import AppKit
#else
    import UIKit
#endif

@available(iOS 9.0, OSX 10.11, *)
private func mappingValue(direction: NSWritingDirection, formatType: NSWritingDirectionFormatType) -> Int {
    return direction.rawValue | formatType.rawValue
}

/**
 An enum that represents a writing direction for an attributed string. Only valid on iOS 9.0+.
 */
public enum WritingDirection: RawRepresentable {

    /// Writing direction is left-to-right. Enables character types with inherent directionality to be overridden when required for special cases, such as for part numbers made of mixed English, digits, and Hebrew letters to be written from right to left.
    case leftToRightOverride

    /// Writing direction is right-to-left. Enables character types with inherent directionality to be overridden when required for special cases, such as for part numbers made of mixed English, digits, and Hebrew letters to be written from right to left.
    case rightToLeftOverride

    /// Writing direction is left-to-right. Text is embedded in text with another writing direction. For example, an English quotation in the middle of an Arabic sentence could be marked as being embedded left-to-right text.
    case leftToRightEmbedding

    /// Writing direction is right-to-left. Text is embedded in text with another writing direction. For example, an English quotation in the middle of an Arabic sentence could be marked as being embedded left-to-right text.
    case rightToLeftEmbedding

    public init?(rawValue: Int) {
        guard #available(iOS 9.0, macOS 10.11, *) else { return nil }
        switch rawValue {
        case mappingValue(direction: .leftToRight, formatType: .override): self = .leftToRightOverride
        case mappingValue(direction: .rightToLeft, formatType: .override): self = .rightToLeftOverride
        case mappingValue(direction: .leftToRight, formatType: .embedding): self = .leftToRightEmbedding
        case mappingValue(direction: .rightToLeft, formatType: .embedding): self = .rightToLeftEmbedding
        default: return nil
        }
    }

    public var rawValue: Int {
        guard #available(iOS 9.0, macOS 10.11, *) else { return 0 }
        switch self {
        case .leftToRightOverride: return mappingValue(direction: .leftToRight, formatType: .override)
        case .rightToLeftOverride: return mappingValue(direction: .rightToLeft, formatType: .override)
        case .leftToRightEmbedding: return mappingValue(direction: .leftToRight, formatType: .embedding)
        case .rightToLeftEmbedding: return mappingValue(direction: .rightToLeft, formatType: .embedding)
        }
    }
}
