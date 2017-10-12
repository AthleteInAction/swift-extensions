//
//  UIView.swift
//  rosterwatch
//
//  Created by William Robinson on 10/10/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UIView {
    
    static func animateFull(_ duration: TimeInterval, delay: TimeInterval = 0, block: @escaping () -> Void, completion: (() -> Void)? = nil){
        
        self.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            block()
            
        }) { success in
            
            completion?()
            
        }
        
    }
    
    var parentViewController: UIViewController? {
        
        var parentResponder: UIResponder? = self
        
        while parentResponder != nil {
            
            parentResponder = parentResponder!.next
            
            if let viewController = parentResponder as? UIViewController {
                
                return viewController
                
            }
            
        }
        
        return nil
        
    }
    
    func bounce(){
        
        UIView.animateFull(0.3, delay: 0, block: {
            
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) {
            
            UIView.animateFull(0.3, block: {
                
                self.transform = CGAffineTransform.identity
                
            })
            
        }
        
    }
    
}
