//
//  NSString+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 26/05/19.
//  Copyright © 2019 Roman Podymov. All rights reserved.
//

#if os(macOS)
    import AppKit
#else
    import UIKit
#endif

extension NSString {
    
    /**
     Get string size with the specified attributes.
     
     - parameter    attrs:   The attributes to use.
     */
    public func size(withSwiftyAttributes attrs: [Attribute]? = nil) -> Size {
        return size(withAttributes: attrs?.foundationAttributes)
    }
    
    /**
     Get string bounding rectangle with the specified attributes.
     
     - parameter    size:               Size of bounding rectangle.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     - parameter    context:            Drawing context.
     */
    public func boundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil, context: DrawingContext?) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes, context: context)
    }
}
