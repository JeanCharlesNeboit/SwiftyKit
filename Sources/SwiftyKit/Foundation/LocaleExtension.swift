//
//  LocaleExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 14/04/2021.
//

import Foundation

public extension Locale {
    var coutryCode: String? {
        (self as NSLocale).object(forKey: .countryCode) as? String
    }
    
    var countryFlag: String? {
        guard let coutryCode = coutryCode else { return nil }
        return Self.countryFlag(countryCode: coutryCode)
    }
    
    var countryName: String? {
        guard let coutryCode = coutryCode else { return nil }
        return Self.countryName(countryCode: coutryCode)
    }
    
    static func countryFlag(countryCode: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    static func countryName(countryCode: String) -> String? {
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            return name
        } else {
            return nil
        }
    }
}
