//
//  UserDefaultsPropertyWrapper.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 01/04/2021.
//

import Foundation

@propertyWrapper
public struct SwiftyUserDefaults<T> {
    let key: String
    let userDefaults: UserDefaults
    let defaultValue: T

    public init(key: String, defaultValue: T, userDefaults: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }
    
    public var wrappedValue: T {
        get { userDefaults.object(forKey: key) as? T ?? defaultValue }
        set { userDefaults.set(newValue, forKey: key) }
    }
}

@propertyWrapper
public struct SwiftyRawUserDefaults<T> where T: RawRepresentable {
    let key: String
    let userDefaults: UserDefaults
    let defaultValue: T

    public init(key: String, defaultValue: T, userDefaults: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults
    }
    
    public var wrappedValue: T {
        get {
            guard let rawValue = userDefaults.object(forKey: key) as? T.RawValue,
                  let value = T.init(rawValue: rawValue) else { return defaultValue }
            return value
        }
        set { userDefaults.set(newValue.rawValue, forKey: key) }
    }
}
