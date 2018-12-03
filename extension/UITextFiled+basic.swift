//
//  UITextFiled+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UITextField{
    
    /// 改变输入框的文字
    func changeText(text: String?) {
        
        self.text = text
        self.sendActions(for: UIControl.Event.valueChanged)
    }
}
