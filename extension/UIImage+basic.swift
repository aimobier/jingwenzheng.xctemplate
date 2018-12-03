//
//  UIImage+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

/// 创建 二维码 图片
extension UIImage {

    /// 容错率级别
    enum InputCorrectionLevel: String {
        /// low 7% 的容错率
        case low = "L"
        /// low 15% 的容错率
        case medium = "M"
        /// low 25% 的容错率
        case quartile = "Q"
        /// low 30% 的容错率
        case high = "H"
    }
    
    /// 创建一个 OCR 二维码图片
    ///
    /// - Parameters:
    ///   - content: 内容
    ///   - level: 容错率级别
    /// - Returns: 图片
    static func QRCodeImage(_ content: String,level: InputCorrectionLevel = InputCorrectionLevel.medium) -> UIImage? {
        
        // 创建二维码滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        // 恢复滤镜默认设置
        filter?.setDefaults()
        
        // 设置滤镜输入数据
        filter?.setValue(content.data(using: String.Encoding.utf8), forKey: "inputMessage")
        
        // 设置二维码的纠错率
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        
        // 生成一个高清图片
        guard let ciImage = filter?.outputImage?.transformed(by: CGAffineTransform.init(scaleX: 20, y: 20)) else { return nil }
        
        return UIImage(ciImage: ciImage)
    }
}

