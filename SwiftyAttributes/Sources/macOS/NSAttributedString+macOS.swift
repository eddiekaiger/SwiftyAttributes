//
//  NSAttributedString+macOS.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/17/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

#if os(macOS)
import AppKit

extension NSAttributedString {

    /**
     Creates an attributed string with a cursor object.

     - parameter    cursor:     The cursor to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withCursor(_ cursor: Cursor) -> NSMutableAttributedString {
        return withAttribute(.cursor(cursor))
    }

    /**
     Creates an attributed string with the specified marked clause segment.

     - parameter    markedClauseSegment:    The index in marked text indicating clause segments.
     - returns:                             A new attributed string with the newly added attribute.
     */
    public func withMarkedClauseSegment(_ segment: Int) -> NSMutableAttributedString {
        return withAttribute(.markedClauseSegment(segment))
    }

    /**
     Creates an attributed string with the specified spelling state.

     - parameter    state:  A state indicating a spelling or grammar error. See `SpellingState` for possible values.
     - returns:             A new attributed string with the newly added attribute.
     */
    public func withSpellingState(_ state: SpellingState) -> NSMutableAttributedString {
        return withAttribute(.spellingState(state))
    }

    /**
     Creates an attributed string with the specified superscript value.

     - parameter    superscript:    The superscript to set for the attributed string.
     - returns:                     A new attributed string with the newly added attribute.
     */
    public func withSuperscript(_ superscript: Int) -> NSMutableAttributedString {
        return withAttribute(.superscript(superscript))
    }

    /**
     Creates an attributed string with the specified text alternatives object.

     - parameter    textAlternatives:   The NSTextAlternatives object representing alternatives for a string that may be presented to the user.
     - returns:                         A new attributed string with the newly added attribute.
     */
    public func withTextAlternatives(_ textAlternatives: TextAlternatives) -> NSMutableAttributedString {
        return withAttribute(.textAlternatives(textAlternatives))
    }

    /**
     Creates an attributed string with a tooltip message.

     - parameter    toolTip:    The toolTip message to set for the attributed string.
     - returns:                 A new attributed string with the newly added attribute.
     */
    public func withToolTip(_ toolTip: String) -> NSMutableAttributedString {
        return withAttribute(.toolTip(toolTip))
    }

}

extension NSAttributedString {

    /**
     Returns the font attributes in effect for the character at the given location.
     */
    public func fontAttributes(in range: Range<Int>) -> [Attribute] {
        return fontAttributes(in: NSRange(range)).swiftyAttributes
    }

    /**
     Returns the ruler (paragraph) attributes in effect for the characters within the given range.
     */
    public func rulerAttributes(in range: Range<Int>) -> [Attribute] {
        return rulerAttributes(in: NSRange(range)).swiftyAttributes
    }

}
#endif
