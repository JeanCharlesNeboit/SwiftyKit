//
//  File.swift
//  
//
//  Created by Jean-Charles Neboit on 29/09/2021.
//

import Foundation

extension FileManager {
    public func contents(atPath: String) -> String? {
        guard let data: Data = contents(atPath: atPath) else { return nil }
        return String(decoding: data, as: UTF8.self)
    }
}
