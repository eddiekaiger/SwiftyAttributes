//
//  WritingDirection.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/5/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import UIKit

private func mappingValue(direction: NSWritingDirection, formatType: NSWritingDirectionFormatType) -> Int {
    return direction.rawValue | formatType.rawValue
}

public enum WritingDirection: RawRepresentable {
    case leftToRightOverride
    case rightToLeftOverride
    case leftToRightEmbedding
    case rightToLeftEmbedding

    public init?(rawValue: Int) {
        switch rawValue {
        case mappingValue(direction: .leftToRight, formatType: .override): self = .leftToRightOverride
        case mappingValue(direction: .rightToLeft, formatType: .override): self = .rightToLeftOverride
        case mappingValue(direction: .leftToRight, formatType: .embedding): self = .leftToRightEmbedding
        case mappingValue(direction: .rightToLeft, formatType: .embedding): self = .rightToLeftEmbedding
        default: return nil
        }
    }

    public var rawValue: Int {
        switch self {
        case .leftToRightOverride: return mappingValue(direction: .leftToRight, formatType: .override)
        case .rightToLeftOverride: return mappingValue(direction: .rightToLeft, formatType: .override)
        case .leftToRightEmbedding: return mappingValue(direction: .leftToRight, formatType: .embedding)
        case .rightToLeftEmbedding: return mappingValue(direction: .rightToLeft, formatType: .embedding)
        }
    }

}
