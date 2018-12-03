//
//  NSObject+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// unique string
    var uniqueString: String {
        /// same
        //        Unmanaged.passUnretained(name).toOpaque()
        return String(UInt(bitPattern: ObjectIdentifier(self)))
    }
}

