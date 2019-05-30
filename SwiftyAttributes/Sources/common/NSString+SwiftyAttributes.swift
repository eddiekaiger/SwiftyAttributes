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

    public func draw(at point: Point, withSwiftyAttributes attrs: [Attribute]? = nil) {
        draw(at: point, withAttributes: attrs?.foundationAttributes)
    }
    
    public func draw(in rect: Rect, withSwiftyAttributes attrs: [Attribute]? = nil) {
        draw(in: rect, withAttributes: attrs?.foundationAttributes)
    }
    
    #if os(macOS)
    @available(macOS, deprecated: 10.12)
    public func draw(with rect: Rect, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil) {
        draw(with: rect, options: options, attributes: swiftyAttributes?.foundationAttributes)
    }
    #endif
    
    public func draw(with rect: Rect, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil, context: DrawingContext?) {
        draw(with: rect, options: options, attributes: swiftyAttributes?.foundationAttributes, context: context)
    }
    
    func size(withSwiftyAttributes attrs: [Attribute]? = nil) -> Size {
        return size(withAttributes: attrs?.foundationAttributes)
    }
    
    func boundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil, context: DrawingContext?) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes, context: context)
    }
    
    #if os(macOS)
    @available(macOS, deprecated: 10.12)
    func boundingRect(with size: Size, options: DrawingOptions = [], swiftyAttributes: [Attribute]? = nil) -> Rect {
        return boundingRect(with: size, options: options, attributes: swiftyAttributes?.foundationAttributes)
    }
    #endif
}
