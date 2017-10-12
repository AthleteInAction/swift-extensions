//
//  UIApplication.swift
//  rosterwatch
//
//  Created by William Robinson on 10/10/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static func copyToClipboard(string: String){
        
        UIPasteboard.general.string = string
        
        guard let window = UIApplication.shared.keyWindow else { return }
        
        let v = UIView(frame: CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 60))
        v.backgroundColor = UIColor.text
        
        let l = UILabel()
        l.font = UIFont.bold(size: 16)
        l.textColor = UIColor.bg
        l.text = "Copied!"
        l.sizeToFit()
        
        v.addSubview(l)
        l.center = CGPoint(x: v.frame.width / 2, y: v.frame.height / 2)
        
        window.addSubview(v)
        
        UIView.animateFull(0.4, delay: 0, block: {
            
            v.frame.origin.y = window.frame.height - v.frame.height
            
        }) {
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { t in
                
                UIView.animateFull(0.3, delay: 0, block: {
                    
                    v.frame.origin.y = window.frame.height
                    
                }, completion: {
                    
                    v.removeFromSuperview()
                    
                })
                
            })
            
        }
        
    }
    
}
