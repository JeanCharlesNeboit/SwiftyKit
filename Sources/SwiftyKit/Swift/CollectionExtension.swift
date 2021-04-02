//
//  File.swift
//  
//
//  Created by Jean-Charles Neboit on 02/04/2021.
//

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
