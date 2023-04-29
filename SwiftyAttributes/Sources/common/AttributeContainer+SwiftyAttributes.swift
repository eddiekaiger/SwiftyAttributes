//
//  AttributeContainer+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 29/04/23.
//  Copyright © 2023 Roman Podymov. All rights reserved.
//

import Foundation

#if canImport(UIKit)
@available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
public extension AttributeContainer {
    mutating func set(attribute: Attribute) {
        switch attribute {
        #if !os(watchOS)
        case .attachment(let value):
            self[AttributeScopes.UIKitAttributes.AttachmentAttribute.self] = value
        case .shadow(let value):
            self[AttributeScopes.UIKitAttributes.ShadowAttribute.self] = value
        #endif
        case .baselineOffset(let value):
            self[AttributeScopes.UIKitAttributes.BaselineOffsetAttribute.self] = value
        case .backgroundColor(let value):
            self[AttributeScopes.UIKitAttributes.BackgroundColorAttribute.self] = value
        case .expansion(let value):
            self[AttributeScopes.UIKitAttributes.ExpansionAttribute.self] = value
        case .font(let value):
            self[AttributeScopes.UIKitAttributes.FontAttribute.self] = value
        case .kern(let value):
            self[AttributeScopes.UIKitAttributes.KernAttribute.self] = value
        case .ligatures(let value):
            self[AttributeScopes.UIKitAttributes.LigatureAttribute.self] = value.rawValue
        case .link(let value):
            self[AttributeScopes.FoundationAttributes.LinkAttribute.self] = value
        case .obliqueness(let value):
            self[AttributeScopes.UIKitAttributes.ObliquenessAttribute.self] = value
        case .paragraphStyle(let value):
            self[AttributeScopes.UIKitAttributes.ParagraphStyleAttribute.self] = value
        case .strokeColor(let value):
            self[AttributeScopes.UIKitAttributes.StrokeColorAttribute.self] = value
        case .strokeWidth(let value):
            self[AttributeScopes.UIKitAttributes.StrokeWidthAttribute.self] = value
        case .strikethroughColor(let value):
            self[AttributeScopes.UIKitAttributes.StrikethroughColorAttribute.self] = value
        case .strikethroughStyle(let value):
            self[AttributeScopes.UIKitAttributes.StrikethroughStyleAttribute.self] = value
        case .textColor(let value):
            self[AttributeScopes.UIKitAttributes.ForegroundColorAttribute.self] = value
        case .textEffect(let value):
            self[AttributeScopes.UIKitAttributes.TextEffectAttribute.self] = value.textEffectStyle
        case .underlineColor(let value):
            self[AttributeScopes.UIKitAttributes.UnderlineColorAttribute.self] = value
        case .underlineStyle(let value):
            self[AttributeScopes.UIKitAttributes.UnderlineStyleAttribute.self] = value
        default:
            break
        }
    }
}
#endif
