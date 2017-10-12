//
//  UIAlert.swift
//  rosterwatch
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func alert(viewController _viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController, title _title: String? = nil, message _message: String? = nil, action_title _action_title: String = "Ok", action _action: (() -> Void)? = nil){
        
        guard let vc = _viewController else { return }
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        
        if let action = _action {
            
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(cancel)
            
            let ok = UIAlertAction(title: _action_title, style: .default, handler: { a in
                
                action()
                
            })
            alert.addAction(ok)
            
        } else {
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            
        }
        
        vc.present(alert, animated: true, completion: nil)
        
    }
    
}
