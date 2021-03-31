//
//  BundleExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 27/03/2021.
//

import Foundation

extension Bundle {    
    public var name: String {
        infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    public var displayName: String {
        infoDictionary?["CFBundleDisplayName"] as? String ?? name
    }
    
    public var version: String {
        (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    public var build: String {
        (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
}
