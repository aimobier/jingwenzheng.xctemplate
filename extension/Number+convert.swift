//
//  Number+convert.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

/// 数字转换协议
protocol ConvertNumberProtocol {
    
    var f: Float { get }
    
    var b: Bool { get }
    
    var d: Double { get }
    var s: String { get }
    
    var i: Int { get }
    var ui: UInt { get }
    
    var i8: Int8 { get }
    var ui8: UInt8 { get }
    
    var i16: Int16 { get }
    var ui16: UInt16 { get }
    
    var i32: Int32 { get }
    var ui32: UInt32 { get }
    
    var i64: Int64 { get }
    var ui64: UInt64 { get }
}

protocol NumberProtocol: ConvertNumberProtocol {
    
    /// get NSNumber
    var n: NSNumber { get }
}

extension NumberProtocol{
    
    /// get Float Value
    var f: Float { return n.f }
    
    /// get Bool Value
    var b: Bool { return n.b }
    
    /// get Double Value
    var d: Double { return n.d }
    /// get  String Value
    var s: String { return n.s }
    
    /// get Int Value
    var i: Int { return n.i }
    /// get UInt Value
    var ui: UInt { return n.ui }
    
    /// get Int8 Value
    var i8: Int8 { return n.i8 }
    /// get UInt8 Value
    var ui8: UInt8 { return n.ui8 }
    
    /// get Int16 Value
    var i16: Int16 { return n.i16 }
    /// get UInt16 Value
    var ui16: UInt16 { return n.ui16 }
    
    /// get Int32 Value
    var i32: Int32 { return n.i32 }
    /// get UInt32 Value
    var ui32: UInt32 { return n.ui32 }
    
    /// get Int64 Value
    var i64: Int64 { return n.i64 }
    /// get UInt64 Value
    var ui64: UInt64 { return n.ui64 }
    
    /// get CGFloat Value
    var cf: CGFloat { return n.cf }
}

extension String: NumberProtocol {
    
    /// get Number value
    var n: NSNumber {
        if let d = Double(self) {
            return NSNumber(value: d)
        }
        return NSNumber(value: 0)
    }
}

extension CGFloat: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: Double(self))
    }
}

extension Float: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Bool: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Double: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Int: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension UInt: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Int8: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension UInt8: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Int16: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension UInt16: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Int32: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension UInt32: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension Int64: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension UInt64: NumberProtocol{
    
    /// get Number value
    var n: NSNumber {
        
        return NSNumber(value: self)
    }
}

extension NSNumber: ConvertNumberProtocol{
    
    /// 转换为 Float
    var f: Float { return self.floatValue }
    
    /// 转换为 Bool
    var b: Bool { return self.boolValue }
    
    /// 转换为 Double
    var d: Double { return self.doubleValue }
    /// 转换为 String
    var s: String { return self.stringValue }
    
    /// 转换为 Int
    var i: Int { return self.intValue }
    /// 转换为 UInt
    var ui: UInt { return self.uintValue }
    
    /// 转换为 Int8
    var i8: Int8 { return self.int8Value }
    /// 转换为 UInt8
    var ui8: UInt8 { return self.uint8Value }
    
    /// 转换为 Int16
    var i16: Int16 { return self.int16Value }
    /// 转换为 UInt16
    var ui16: UInt16 { return self.uint16Value }
    
    /// 转换为 Int32
    var i32: Int32 { return self.int32Value }
    /// 转换为 UInt32
    var ui32: UInt32 { return self.uint32Value }
    
    /// 转换为 Int64
    var i64: Int64 { return self.int64Value }
    /// 转换为 UInt64
    var ui64: UInt64 { return self.uint64Value }
    
    /// 转换为 CGFloat
    var cf: CGFloat { return CGFloat(self.doubleValue) }
}
