//
//  String+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension String{
    
    /// 是否含有 string
    ///
    /// - Parameters:
    ///   - find: string
    ///   - ignorinCase: 忽略大小写
    /// - Returns: 是否
    func contains(_ find: String,ignorinCase: Bool = false) -> Bool {
        if ignorinCase {
            return self.range(of: find, options: .caseInsensitive) != nil
        }
        return self.range(of: find) != nil
    }
}

extension String{
    
    /// 将字符串转换为 pinyin 字符串
    ///
    /// - Parameter removeSpace: 移除空格
    /// - Returns: pinyin 字符串
    func toPinYinString(_ removeSpace: Bool = true) -> String{
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        if removeSpace {
            return String(mutableString).replacingOccurrences(of: " ", with: "")
        }
        return String(mutableString)
    }
}


/// use it to ""[0...3]
extension String {
    
    /// Subscript
    subscript (bounds: CountableClosedRange<Int>) -> String? {
        return getStr(start: bounds.lowerBound, end: bounds.upperBound)
    }
    
    /// Subscript
    subscript (bounds: CountableRange<Int>) -> String? {
        return getStr(start: bounds.lowerBound, end: bounds.upperBound)
    }
    
    /// SubScript 辅助方法
    private func getStr(start: Int, end: Int) -> String? {
        if start > end { return nil }
        let start = index(startIndex, offsetBy: min(start, self.count))
        let end = index(startIndex, offsetBy: min(end, self.count))
        let str = String(self[start..<end])
        return str.count == 0 ? nil : str
    }
}
