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

    public func withCursor(_ cursor: Cursor) -> NSMutableAttributedString {
        return withAttribute(.cursor(cursor))
    }

    public func withMarkedClauseSegment(_ segment: Int) -> NSMutableAttributedString {
        return withAttribute(.markedClauseSegment(segment))
    }

    public func withSpellingState(_ state: SpellingState) -> NSMutableAttributedString {
        return withAttribute(.spellingState(state))
    }

    public func withSuperscript(_ superscript: Int) -> NSMutableAttributedString {
        return withAttribute(.superscript(superscript))
    }

    public func withToolTip(_ tooltip: String) -> NSMutableAttributedString {
        return withAttribute(.toolTip(tooltip))
    }

}

extension NSAttributedString {

    public func fontAttributes(in range: Range<Int>) -> [Attribute] {
        return fontAttributes(in: NSRange(range)).swiftyAttributes
    }

    public func rulerAttributes(in range: Range<Int>) -> [Attribute] {
        return rulerAttributes(in: NSRange(range)).swiftyAttributes
    }

}
#endif
