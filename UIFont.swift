//
//  UIFont.swift
//  rosterwatch
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func regular(size: CGFloat) -> UIFont { return UIFont.systemFont(ofSize: size) }
    static func bold(size: CGFloat) -> UIFont { return UIFont.boldSystemFont(ofSize: size) }
    
}
