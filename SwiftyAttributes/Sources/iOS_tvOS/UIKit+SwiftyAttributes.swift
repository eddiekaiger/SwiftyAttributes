//
//  UIKit+SwiftyAttributes.swift
//  SwiftyAttributes
//
//  Created by Roman Podymov on 26/05/19.
//  Copyright © 2019 Roman Podymov. All rights reserved.
//

#if os(macOS)
#elseif os(watchOS)
#else
    import UIKit
    public typealias NavigationBar = UINavigationBar
#endif

#if os(macOS)
#elseif os(watchOS)
#else
extension NavigationBar {

    public var swiftyTitleTextAttributes: [Attribute]? {
        set {
            titleTextAttributes = newValue?.foundationAttributes
        }
        
        get {
            return titleTextAttributes?.swiftyAttributes
        }
    }
    
    @available(iOS 11, tvOS 11, *)
    public var swiftyLargeTitleTextAttributes: [Attribute]? {
        set {
            largeTitleTextAttributes = newValue?.foundationAttributes
        }
        
        get {
            return largeTitleTextAttributes?.swiftyAttributes
        }
    }
}
#endif
