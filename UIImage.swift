//
//  UIImage.swift
//  rosterwatch
//
//  Created by William Robinson on 10/10/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resize(size _size: CGSize) -> UIImage {
        
        let size = self.size
        
        let widthRatio  = _size.width  / self.size.width
        let heightRatio = _size.height / self.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    static func templateImage(string: String) -> UIImage { return UIImage(named: string)!.withRenderingMode(.alwaysTemplate) }
    
}
