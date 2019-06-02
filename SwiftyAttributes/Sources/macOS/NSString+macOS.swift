//
//  NSString+macOS.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 02/06/2019.
//  Copyright © 2019 Roman Podymov. All rights reserved.
//

#if os(macOS)
import AppKit

extension NSString {

    /**
     Draws string with the specified attributes.
     
     - parameter    rect:               Rectangle to draw the string.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     */
    @available(macOS, deprecated: 10.12)
    public func draw(with rect: Rect, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil) {
        draw(with: rect, options: options, attributes: swiftyAttributes?.foundationAttributes)
    }
    
    /**
     Draws string with the specified attributes.
     
     - parameter    size:               Size of string.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     */
    @available(macOS, deprecated: 10.12)
    public func boundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes)
    }
}
#endif
