//
//  WritingDirection.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/5/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import UIKit

private func mappingValueForDirection(direction: NSWritingDirection, formatType: NSWritingDirectionFormatType) -> Int {
    return direction.rawValue | formatType.rawValue
}

public enum WritingDirection: RawRepresentable {
    case LeftToRightOverride
    case RightToLeftOverride
    case LeftToRightEmbedding
    case RightToLeftEmbedding

    public init?(rawValue: Int) {
        switch rawValue {
        case mappingValueForDirection(.LeftToRight, formatType: .Override): self = .LeftToRightOverride
        case mappingValueForDirection(.RightToLeft, formatType: .Override): self = .RightToLeftOverride
        case mappingValueForDirection(.LeftToRight, formatType: .Embedding): self = .LeftToRightEmbedding
        case mappingValueForDirection(.RightToLeft, formatType: .Embedding): self = .RightToLeftEmbedding
        default: return nil
        }
    }

    public var rawValue: Int {
        switch self {
        case .LeftToRightOverride: return mappingValueForDirection(.LeftToRight, formatType: .Override)
        case .RightToLeftOverride: return mappingValueForDirection(.RightToLeft, formatType: .Override)
        case .LeftToRightEmbedding: return mappingValueForDirection(.LeftToRight, formatType: .Embedding)
        case .RightToLeftEmbedding: return mappingValueForDirection(.RightToLeft, formatType: .Embedding)
        }
    }

}
