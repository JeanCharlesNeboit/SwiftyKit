//
//  CellIdentifiable.swift
//  
//
//  Created by Jean-Charles Neboit on 30/03/2021.
//

#if canImport(UIKit)
import UIKit

public protocol CellIdentifiable {
    static var identifier: String { get }
    static var nib: UINib { get }
}

public extension CellIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
#endif
