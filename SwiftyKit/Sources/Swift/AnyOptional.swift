//
//  File.swift
//  
//
//  Created by Jean-Charles Neboit on 28/09/2021.
//

import Foundation

public protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}
