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
     Draws string with the specified attributes.
     
     - parameter    point:   Point to draw the string.
     - parameter    attrs:   The attributes to use.
     */
    public func draw(at point: Point, withSwiftyAttributes attrs: [Attribute]? = nil) {
        draw(at: point, withAttributes: attrs?.foundationAttributes)
    }
    
    /**
     Draws string with the specified attributes.
     
     - parameter    rect:    Rectangle to draw the string.
     - parameter    attrs:   The attributes to use.
     */
    public func draw(in rect: Rect, withSwiftyAttributes attrs: [Attribute]? = nil) {
        draw(in: rect, withAttributes: attrs?.foundationAttributes)
    }
        
    /**
     Draws string with the specified attributes.
     
     - parameter    rect:               Rectangle to draw the string.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     - parameter    context:            Drawing context.
     */
    public func draw(with rect: Rect, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil, context: DrawingContext?) {
        draw(with: rect, options: options, attributes: swiftyAttributes?.foundationAttributes, context: context)
    }
    
    /**
     Draws string with the specified attributes.
     
     - parameter    attrs:   The attributes to use.
     */
    public func size(withSwiftyAttributes attrs: [Attribute]? = nil) -> Size {
        return size(withAttributes: attrs?.foundationAttributes)
    }
    
    /**
     Draws string with the specified attributes.
     
     - parameter    size:               Size of string.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     - parameter    context:            Drawing context.
     */
    public func boundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil, context: DrawingContext?) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes, context: context)
    }
}
