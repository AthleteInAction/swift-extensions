//
//  JSON.swift
//  rosterwatch
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import Alamofire
import SwiftyJSON

extension JSON {
    
    static func fromResponse(_ _any: Any) -> JSON {
        let response: DataResponse<Any> = _any as! DataResponse<Any>
        return JSON(response.result.value!)
    }
    
}

