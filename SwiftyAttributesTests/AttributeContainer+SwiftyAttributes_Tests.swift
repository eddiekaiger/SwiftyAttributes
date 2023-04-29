//
//  AttributeContainer+SwiftyAttributes_Tests.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 29/04/23.
//  Copyright © 2023 Roman Podymov. All rights reserved.
//

import XCTest
import SwiftyAttributes

class AttributeContainer_SwiftyAttributes_Tests: XCTestCase {
    #if canImport(UIKit)
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testAttributeContainerSetAttribute() {
        var container = AttributeContainer()
        container.set(attribute: .textColor(.blue))
        container.set(attribute: .backgroundColor(.yellow))
        XCTAssertEqual(container.foregroundColor, UIColor.blue)
        XCTAssertEqual(container.backgroundColor, UIColor.yellow)
    }
    #endif
}
