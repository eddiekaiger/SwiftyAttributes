//
//  UIKit+SwiftyAttributes_Tests.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 26/05/19.
//  Copyright © 2019 Roman Podymov. All rights reserved.
//

import XCTest
import SwiftyAttributes

#if os(macOS)
#elseif os(watchOS)
#else
class UIKit_SwiftyAttributes_Tests: XCTestCase {

    func testTitleTextAttributes() {

        let subject = UINavigationBar()
        subject.swiftyTitleTextAttributes = [
            .backgroundColor(.yellow),
            .font(.systemFont(ofSize: 19))
        ]
        
        let exptected = UINavigationBar()
        exptected.titleTextAttributes = [
            NSAttributedString.Key.backgroundColor: UIColor.yellow,
            NSAttributedString.Key.font: Font.systemFont(ofSize: 19)
        ]
        
        XCTAssertNotNil(subject.swiftyTitleTextAttributes?.foundationAttributes)
        XCTAssertNotNil(exptected.titleTextAttributes)
        XCTAssertEqual(subject.swiftyTitleTextAttributes!.foundationAttributes as NSDictionary, exptected.titleTextAttributes! as NSDictionary)
    }
    
    #if os(iOS)
    func testLargeTitleTextAttributes() {
        
        guard #available(iOS 11.0, *) else {
            return
        }
        
        let subject = UINavigationBar()
        subject.swiftyLargeTitleTextAttributes = [
            .backgroundColor(.yellow),
            .font(.systemFont(ofSize: 19))
        ]
        
        let exptected = UINavigationBar()
        exptected.largeTitleTextAttributes = [
            NSAttributedString.Key.backgroundColor: UIColor.yellow,
            NSAttributedString.Key.font: Font.systemFont(ofSize: 19)
        ]
        
        XCTAssertNotNil(subject.swiftyLargeTitleTextAttributes?.foundationAttributes)
        XCTAssertNotNil(exptected.largeTitleTextAttributes)
        XCTAssertEqual(subject.swiftyLargeTitleTextAttributes!.foundationAttributes as NSDictionary, exptected.largeTitleTextAttributes! as NSDictionary)
    }
    #endif
}
#endif
