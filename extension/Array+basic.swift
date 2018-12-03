//
//  Array+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import Foundation

/// 数组去重
extension Array where Element: Hashable {
    
    /// Remove repeat objects
    /// from https://stackoverflow.com/a/29904817/4242817
    ///
    /// - Returns: Processed
    func unique() -> Array {
        
        return Array(Set(self))
    }
    
    /// Remove repeat objects and keep sort
    ///
    /// - Returns: Processed
    func uniqueAndKeepSort() -> Array {
        
        var array = [Element]()
        
        for ele in self where !array.contains(ele) {
            array.append(ele)
        }
        
        return array
    }
}

