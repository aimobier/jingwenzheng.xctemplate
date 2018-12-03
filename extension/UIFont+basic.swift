//
//  UIFont+basic.swift
//  anbaobao
//
//  Created by 荆文征 on 2018/9/5.
//  Copyright © 2018年 com.baimaodai. All rights reserved.
//

import UIKit

extension UIFont {

    static let f10 = UIFont.systemFont(ofSize: 10)
    static let f12 = UIFont.systemFont(ofSize: 12)
    static let f13 = UIFont.systemFont(ofSize: 13)
    static let f14 = UIFont.systemFont(ofSize: 14)
    static let f15 = UIFont.systemFont(ofSize: 15)
    static let f16 = UIFont.systemFont(ofSize: 16)
    static let f18 = UIFont.systemFont(ofSize: 18)
    static let f20 = UIFont.systemFont(ofSize: 20)
    static let f24 = UIFont.systemFont(ofSize: 24)
    static let f30 = UIFont.systemFont(ofSize: 30)
    static let f64 = UIFont.systemFont(ofSize: 64)
}

extension UIFont {

    private func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        if let descriptor = fontDescriptor.withSymbolicTraits(traits) {
            return UIFont(descriptor: descriptor, size: 0)
        }
        return self //size 0 means keep the size as it is
    }

    /// get font's bold
    var bold: UIFont {
        return withTraits(traits: .traitBold)
    }

    /// get font's italic
    var italic: UIFont {
        return withTraits(traits: .traitItalic)
    }
}
