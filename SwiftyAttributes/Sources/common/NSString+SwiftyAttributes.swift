//
//  NSString+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 26/05/19.
//  Copyright © 2019 Roman Podymov. All rights reserved.
//

#if os(macOS)
    import AppKit
    public typealias Point = NSPoint
    public typealias Size = NSSize
    public typealias Rect = NSRect
    public typealias DrawingOptions = NSString.DrawingOptions
#else
    import UIKit
    public typealias Point = CGPoint
    public typealias Size = CGSize
    public typealias Rect = CGRect
    public typealias DrawingOptions = NSStringDrawingOptions
#endif

public typealias DrawingContext = NSStringDrawingContext

extension NSString {
    
    /**
     Get string size with the specified attributes.
     
     - parameter    attrs:   The attributes to use.
     */
    public func swiftySize(withSwiftyAttributes attrs: [Attribute]? = nil) -> Size {
        return size(withAttributes: attrs?.foundationAttributes)
    }
    
    /**
     Get string bounding rectangle with the specified attributes.
     
     - parameter    size:               Size of bounding rectangle.
     - parameter    options:            Aditional options.
     - parameter    swiftyAttributes:   The attributes to use.
     - parameter    context:            Drawing context.
     */
    public func swiftyBoundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil, context: DrawingContext?) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes, context: context)
    }
}
