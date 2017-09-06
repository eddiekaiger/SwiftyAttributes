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
public enum SpellingState: Int {

    /// The spelling error indicator.
    case spelling = 1

    /// The grammar error indicator.
    case grammar = 2
}
#endif
