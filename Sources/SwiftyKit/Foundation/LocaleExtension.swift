//
//  LocaleExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 14/04/2021.
//

import Foundation

public extension Locale {
    var countryCode: String? {
        (self as NSLocale).object(forKey: .countryCode) as? String
    }
    
//    var languageCode: String? {
//        (self as NSLocale).object(forKey: .languageCode) as? String
//    }
    
    var countryFlag: String? {
        guard let countryCode = countryCode else { return nil }
        return Self.countryFlag(countryCode: countryCode)
    }
    
    var countryName: String? {
        guard let countryCode = countryCode else { return nil }
        return Self.countryName(countryCode: countryCode, locale: self)
    }
    
    var languageName: String? {
        guard let languageCode = languageCode else { return nil }
        return Self.languageName(languageCode: languageCode, locale: self)
    }
    
    static func countryFlag(countryCode: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    static func countryName(countryCode: String, locale: Locale = Locale.current) -> String? {
        if let name = (locale as NSLocale).localizedString(forCountryCode: countryCode) {
            return name
        } else {
            return nil
        }
    }
    
    static func languageName(languageCode: String, locale: Locale = Locale.current) -> String? {
        if let name = (locale as NSLocale).localizedString(forLanguageCode: languageCode) {
            return name
        } else {
            return nil
        }
    }
}
