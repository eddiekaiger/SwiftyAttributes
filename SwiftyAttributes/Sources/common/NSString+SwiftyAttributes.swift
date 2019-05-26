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

    public func draw(at point: Point, withAttributes attrs: [Attribute]? = nil) {
        draw(at: point, withAttributes: attrs?.foundationAttributes)
    }
    
    public func draw(in rect: Rect, withAttributes attrs: [Attribute]? = nil) {
        draw(in: rect, withAttributes: attrs?.foundationAttributes)
    }
    
    @available(macOS, deprecated: 10.12)
    public func draw(with rect: Rect, options: DrawingOptions = [], attributes: [Attribute]? = nil) {
        draw(with: rect, options: options, attributes: attributes?.foundationAttributes)
    }
    
    public func draw(with rect: Rect, options: DrawingOptions = [], attributes: [Attribute]? = nil, context: DrawingContext?) {
        draw(with: rect, options: options, attributes: attributes?.foundationAttributes, context: context)
    }
    
    func size(withAttributes attrs: [Attribute]? = nil) -> Size {
        return size(withAttributes: attrs?.foundationAttributes)
    }
    
    func boundingRect(with size: Size, options: DrawingOptions = [], attributes: [Attribute]? = nil, context: DrawingContext?) -> Rect {
        return boundingRect(with: size, options: options, attributes: attributes?.foundationAttributes, context: context)
    }
    
    @available(macOS, deprecated: 10.12)
    func boundingRect(with size: Size, options: DrawingOptions = [], attributes: [Attribute]? = nil) -> Rect {
        return boundingRect(with: size, options: options, attributes: attributes?.foundationAttributes)
    }
}
