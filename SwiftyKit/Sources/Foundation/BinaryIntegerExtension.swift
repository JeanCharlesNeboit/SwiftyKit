//
//  BinaryIntegerExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 29/09/2022.
//

import Foundation

extension BinaryInteger {
    public var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
