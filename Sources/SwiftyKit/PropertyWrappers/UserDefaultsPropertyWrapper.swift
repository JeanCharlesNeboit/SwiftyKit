//
//  UserDefaultsPropertyWrapper.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 01/04/2021.
//

import Foundation

open class AbstractUserDefault<T> {
    // MARK: - Properties
    let key: String
    let userDefaults: UserDefaults
    let defaultValue: T

    // MARK: - Initialization
    public init(wrappedValue: T, key: String, userDefaults: UserDefaults = UserDefaults.standard) {
        self.key = key
        self.defaultValue = wrappedValue
        self.userDefaults = userDefaults
    }
}

@propertyWrapper
open class UserDefault<T>: AbstractUserDefault<T> {
    // MARK: - Properties
    open var wrappedValue: T {
        get { userDefaults.object(forKey: key) as? T ?? defaultValue }
        set { userDefaults.set(newValue, forKey: key) }
    }
}

@propertyWrapper
open class RawUserDefault<T>: AbstractUserDefault<T> where T: RawRepresentable {
    // MARK: - Properties
    open var wrappedValue: T {
        get {
            guard let rawValue = userDefaults.object(forKey: key) as? T.RawValue,
                  let value = T.init(rawValue: rawValue) else { return defaultValue }
            return value
        }
        set { userDefaults.set(newValue.rawValue, forKey: key) }
    }
}
