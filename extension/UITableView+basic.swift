//
//  UITableView+basic.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import UIKit

extension UITableView{
    
    /// 检查表格中 是否 含有 IndexPath
    func isLegitimate(indexPath: IndexPath?) -> Bool {
        guard let indexPath = indexPath else { return false }
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    /// 设置 默认选中的 IndexPath
    ///
    /// - Parameters:
    ///   - indexPath: indexPath
    ///   - isSelected: 是否触发 delegate 选中方法
    func setDefaultIndexPath(_ indexPath: IndexPath?,isSelected: Bool = false){
        
        guard let indexPath = indexPath else { return }
        setDefaultIndexPaths([indexPath], isSelected: isSelected)
    }
    
    /// 设置 默认的 选中 IndexPaths 集合
    ///
    /// - Parameters:
    ///   - indexPaths: indexPaths
    ///   - isSelected: 是否 触发 delegate 方法
    func setDefaultIndexPaths(_ indexPaths: [IndexPath],isSelected: Bool = false){
        
        for indexPath in indexPaths {
            
            self.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.middle)
    
            if isSelected { // 触发 delegate
                self.delegate?.tableView?(self, didSelectRowAt: indexPath)
            }
        }
        
        _ = self.indexPathsForSelectedRows
    }
}
