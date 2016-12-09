//
//  VerticalGlyphForm.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 11/16/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

/**
 An enum to indicate horizontal or vertical writing direction. On iOS, only horizontal form is valid.
 */
public enum VerticalGlyphForm: Int {

    /// Horizontal writing direction.
    case horizontal = 0

    #if os(macOS)
    /// Vertical writing direction.
    case vertical = 1
    #endif
}
