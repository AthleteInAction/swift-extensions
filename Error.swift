//
//  Error.swift
//  rosterwatch
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import Foundation

extension Error {
    
    func p(_ message: String){
        
        print("\n+++++++++++++++++++++++++")
        print(message)
        print("+++++++++++++++++++++++++")
        print(self)
        print("+++++++++++++++++++++++++\n")
        
    }
    
}
