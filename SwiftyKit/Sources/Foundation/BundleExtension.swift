//
//  BundleExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 27/03/2021.
//

import Foundation

public extension Bundle {
    var name: String {
        infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    var displayName: String {
        infoDictionary?["CFBundleDisplayName"] as? String ?? name
    }
    
    var version: String {
        (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    var build: String {
        (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
    
    func info(release: String? = nil) -> String {
        [
            "\(displayName)",
            release,
            "v\(version)",
            "(\(build))"
        ].compactMap { $0 }
        .joined(separator: " ")
    }
}
