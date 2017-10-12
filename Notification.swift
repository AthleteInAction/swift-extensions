//
//  Notification.swift
//  rosterwatch
//
//  Created by William Robinson on 10/11/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import Foundation

extension Notification {
    
    static func post(_ name: String, object: Any? = nil, userInfo: [String:Any]? = nil){
        
        NotificationCenter.default.post(name: NSNotification.Name(name), object: object, userInfo: userInfo)
        
    }
    static func post(_ name: Notification.Name, object: Any? = nil, userInfo: [String:Any]? = nil){
        
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
        
    }
    
    static var left_team: Notification.Name = Notification.Name("left_team")
    
}

extension Notification.Name {
    
    func post(object: Any? = nil, userInfo: [String:Any]? = nil){
        
        Notification.post(self, object: object, userInfo: userInfo)
        
    }
    func observe(_ target: Any, selector: Selector, object: Any? = nil){
        
        NotificationCenter.default.addObserver(target, selector: selector, name: self, object: object)
        
    }
    
}
