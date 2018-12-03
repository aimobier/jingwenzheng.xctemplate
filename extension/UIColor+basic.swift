//
//  UIColor+basic.swift
//  anbaobao
//
//  Created by 荆文征 on 2018/9/5.
//  Copyright © 2018年 com.baimaodai. All rights reserved.
//

import UIKit

extension UIColor {

    /// 黑色
    static let _000000 = UIColor(rgb: 0x000000)
    /// 白色
    static let _ffffff = UIColor(rgb: 0xffffff)
    
    /// system placeholder Text Color
    static let placeholderTextColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)

    /// get random color
    static var random: UIColor {
        return UIColor(red: drand48().cf, green: drand48().cf, blue: drand48().cf, alpha: 1)
    }
}

extension UIColor {

    /// get alpha 0 color
    var a0: UIColor { return self.withAlphaComponent(0) }
    /// get alpha 0.1 color
    var a1: UIColor { return self.withAlphaComponent(0.1) }
    /// get alpha 0.2 color
    var a2: UIColor { return self.withAlphaComponent(0.2) }
    /// get alpha 0.3 color
    var a3: UIColor { return self.withAlphaComponent(0.3) }
    /// get alpha 0.4 color
    var a4: UIColor { return self.withAlphaComponent(0.4) }
    /// get alpha 0.5 color
    var a5: UIColor { return self.withAlphaComponent(0.5) }
    /// get alpha 0.6 color
    var a6: UIColor { return self.withAlphaComponent(0.6) }
    /// get alpha 0.7 color
    var a7: UIColor { return self.withAlphaComponent(0.7) }
    /// get alpha 0.8 color
    var a8: UIColor { return self.withAlphaComponent(0.8) }
    /// get alpha 0.9 color
    var a9: UIColor { return self.withAlphaComponent(0.9) }

    /// get alpha color
    ///
    /// - Parameter a: alpha
    /// - Returns: 颜色值
    func alpha(_ value: CGFloat) -> UIColor {
        return self.withAlphaComponent(value)
    }
}

extension UIColor {

    /// 根据 进度 来获取，两个颜色中间的值
    ///
    /// - Parameters:
    ///   - end: 第二个色值
    ///   - fraction: 进度
    /// - Returns: 颜色
    func interpolateRGBColorTo(_ end: UIColor, fraction: CGFloat) -> UIColor? {
        let f = min(max(0, fraction), 1)

        guard let c1 = self.cgColor.components, let c2 = end.cgColor.components else { return nil }

        let r: CGFloat = CGFloat(c1[0] + (c2[0] - c1[0]) * f)
        let g: CGFloat = CGFloat(c1[1] + (c2[1] - c1[1]) * f)
        let b: CGFloat = CGFloat(c1[2] + (c2[2] - c1[2]) * f)
        let a: CGFloat = CGFloat(c1[3] + (c2[3] - c1[3]) * f)

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

    /// 获取色值的额 hex 值
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }

    /// 根据 红 绿 蓝 创建颜色
    ///
    /// - Parameters:
    ///   - red: 0-255 之间的数值
    ///   - green: 0-255 之间的数值
    ///   - blue: 0-255 之间的数值
    ///   - a: 透明度
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }

    /// 根据 hex 16禁止数值 获取颜色
    ///
    /// - Parameters:
    ///   - rgb: 16进制颜色
    ///   - a: 透明度
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}
