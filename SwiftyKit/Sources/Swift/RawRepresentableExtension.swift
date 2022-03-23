//
//  RawRepresentableExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 07/04/2021.
//

public extension RawRepresentable {
    func callAsFunction() -> RawValue {
        return self.rawValue
    }
}
