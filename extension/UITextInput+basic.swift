//
//  UITextInput+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UITextInput {
    
    /// 更新文字，并且保持 输入框的 插入位置的方法
    ///
    /// - Parameter change: 修改回调
    func updateText(_ change: ((_ textFiled: UITextInput) -> Void)) {
        
        let editRange = selectedTextRange
        change(self)
        selectedTextRange = editRange
    }
}
