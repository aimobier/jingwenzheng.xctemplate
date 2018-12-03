//
//  UIView+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Takes the screenshot of the screen and returns the corresponding image
    ///
    /// - Returns: (Optional)image captured as a screenshot
    open func takeScreenshot() -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
