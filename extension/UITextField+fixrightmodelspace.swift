//
//  UITextField+fixrightmodelspace.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UITextField {
    /// Runtime 键
    private struct AssociatedKeys {
        
        static var toggleState: UInt8 = 0
    }
    
    private var isFixedRightSpace: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.toggleState) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if self.textAlignment == .right && !isFixedRightSpace {
            self.isFixedRightSpace = true
            self.addTarget(self, action: #selector(replaceNormalSpacesWithNonBreakingSpaces(textFiled:)), for: UIControl.Event.editingChanged)
        }
        
        return super.hitTest(point, with: event)
    }
    
    @objc func replaceNormalSpacesWithNonBreakingSpaces(textFiled: UITextField) {
        
        if textFiled.markedTextRange == nil && textFiled.text?.contains(" ") ?? false {
            
            textFiled.updateText { (_) in
                
                textFiled.text = textFiled.text?.replacingOccurrences(of: " ", with: "\u{00a0}")
            }
        }
    }
}

