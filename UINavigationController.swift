//
//  UINavigationController.swift
//  rosterwatch
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        parent?.edgesForExtendedLayout = UIRectEdge()
//        let image = UIImage(named: "icon-chevron-left")?.withRenderingMode(.alwaysTemplate)
//        navigationBar.backIndicatorImage = image
//        navigationBar.backIndicatorTransitionMaskImage = image
        
    }
    
}
