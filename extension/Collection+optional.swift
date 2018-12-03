//
//  Collection+optional.swift
//  BasicIosProject
//
//  Created by 荆文征 on 2018/12/3.
//  Copyright © 2018 aimobier.cloud. All rights reserved.
//

import Foundation

protocol _OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: _OptionalType {
    /// Cast `Optional<Wrapped>` to `Wrapped?`
    public var value: Wrapped? {
        return self
    }
}

extension Collection where Element: _OptionalType {
    
    /// get first not nil object
    ///
    /// - Returns: first no nil
    func firstNotNil() -> Element.Wrapped? {
        for element in self {
            if element.value != nil { return element.value }
        }
        return nil
    }
}
