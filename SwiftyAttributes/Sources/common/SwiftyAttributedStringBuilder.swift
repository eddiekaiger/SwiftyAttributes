//
//  SwiftyAttributedStringBuilder.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 09/09/21.
//  Copyright © 2021 Roman Podymov. All rights reserved.
//

#if swift(>=5.4)
import Foundation

public protocol AttributesProvider {
    var attributes: [Attribute] { get }
}

extension Attribute: AttributesProvider {
    public var attributes: [Attribute] { [self] }
}

extension Array: AttributesProvider where Element == Attribute {
    public var attributes: [Attribute] { self }
}

@resultBuilder
public struct SwiftyAttributedStringBuilder {
    public static func buildBlock(_ components: AttributesProvider...) -> [Attribute] {
        components.flatMap { $0.attributes }
    }

    public static func buildEither(first components: [AttributesProvider]) -> [Attribute] {
        components.flatMap { $0.attributes }
    }

    public static func buildEither(second components: [AttributesProvider]) -> [Attribute] {
        components.flatMap { $0.attributes }
    }

    public static func buildOptional(_ components: [Attribute]?) -> [Attribute] {
        components?.flatMap { $0.attributes } ?? []
    }

    public static func buildFinalResult(_ components: [Attribute]) -> [NSAttributedString.Key: Any] {
        dictionary(from: components)
    }
}
#endif
