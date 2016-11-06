//
//  Ligatures.swift
//  SwiftyAttributes
//
//  Created by Eddie Kaiger on 10/5/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

/**
 Ligatures cause specific character combinations to be rendered using a single custom glyph that corresponds to those characters.
 */
public enum Ligatures: Int {

    /// Correspond to no ligatures.
    case none

    /// Corresponds to the use of the default ligatures.
    case `default`
}
