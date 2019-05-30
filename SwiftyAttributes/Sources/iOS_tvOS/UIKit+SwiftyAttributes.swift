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
extension UINavigationBar {

    /// A swifty wrapper for UINavigationBar.titleTextAttributes. Use it if you prefer [Attribute] to [NSAttributedString.Key:Any].
    public var swiftyTitleTextAttributes: [Attribute]? {
        set {
            titleTextAttributes = newValue?.foundationAttributes
        }
        
        get {
            return titleTextAttributes?.swiftyAttributes
        }
    }
    
    /// A swifty wrapper for UINavigationBar.largeTitleTextAttributes. Use it if you prefer [Attribute] to [NSAttributedString.Key:Any].
    #if os(iOS)
    @available(iOS 11, *)
    public var swiftyLargeTitleTextAttributes: [Attribute]? {
        set {
            largeTitleTextAttributes = newValue?.foundationAttributes
        }
        
        get {
            return largeTitleTextAttributes?.swiftyAttributes
        }
    }
    #endif
}
#endif
