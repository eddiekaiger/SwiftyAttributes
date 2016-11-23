//
//  SpellingState.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/16/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

#if os(macOS)
import AppKit

/**
     This enum controls the display of the spelling and grammar indicators on text,
     highlighting portions of the text that are flagged for spelling or grammar issues. 
     This should be used with `Attribute.spellingState`.
 */
public enum SpellingState: RawRepresentable {
    case none
    case spellingFlag
    case grammarFlag

    public init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .none
        case NSSpellingStateSpellingFlag: self = .spellingFlag
        case NSSpellingStateGrammarFlag: self = .grammarFlag
        default: return nil
        }
    }

    public var rawValue: Int {
        switch self {
        case .none: return 0
        case .spellingFlag: return NSSpellingStateSpellingFlag
        case .grammarFlag: return NSSpellingStateGrammarFlag
        }
    }
}
#endif
