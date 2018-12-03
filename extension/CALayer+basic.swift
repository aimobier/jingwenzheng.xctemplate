//
//  CALayer+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension CALayer {
    
    open override func setValue(_ value: Any?, forKey key: String) {
        
        /// If key is borderColor, and the value is the type of a UIColor.
        if key == "borderColor", let color = value as? UIColor {
            
            /// After converting UIColor to CGColor, call the system method.
            return super.setValue(color.cgColor, forKey: key)
        }
        
        super.setValue(value, forKey: key)
    }
}

