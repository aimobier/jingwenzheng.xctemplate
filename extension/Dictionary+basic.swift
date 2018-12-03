//
//  Dictionary+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import Foundation

extension Dictionary where Value == Any? {
    
    /// 清楚 空白 对象
    func removeNilValue() -> [Key: Any] {
        
        var dict = [Key: Any]()
        
        for value in self {
            
            if let nvalue = value.value {
                
                dict[value.key] = nvalue
            }
        }
        
        return dict
    }
}
