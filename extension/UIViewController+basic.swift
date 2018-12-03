//
//  UIViewController+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UIViewController{
    
    /// get current viewController
    ///
    /// - Parameter controller: UIViewController
    /// - Returns: viewController
    class func currentViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return currentViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return currentViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return currentViewController(controller: presented)
        }
        return controller
    }
}
