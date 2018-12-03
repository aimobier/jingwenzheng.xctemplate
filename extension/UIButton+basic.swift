//
//  UIButton+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UIButton{
    
    /// image and title filp
    func flip() {
        
        transform = CGAffineTransform(scaleX: -1, y: 1)
        titleLabel?.transform = CGAffineTransform(scaleX: -1, y: 1)
        imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    /// set backgroundImage
    ///
    /// - Parameters:
    ///   - image: image
    ///   - state: mode
    func setBackgroundImageAndContentMode(_ image: UIImage, state: UIControl.State = .normal) {
        
        self.setBackgroundImage(image, for: state)
        
        self.layoutIfNeeded()
        self.superview?.layoutIfNeeded()
        self.subviews.first?.contentMode = .scaleAspectFill
    }
}
