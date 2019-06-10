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
     Get string bounding rectangle with the specified attributes.
     
     - parameter    size:               Size of bounding rectangle.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     */
    @available(macOS, deprecated: 10.12)
    public func swifty_boundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes)
    }
}
#endif
