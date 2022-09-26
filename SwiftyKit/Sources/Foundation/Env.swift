//
//  Env.swift
//  
//
//  Created by Jean-Charles Neboit on 08/02/2022.
//

import Foundation

public enum Env {
    public static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    public static var isRelease: Bool {
        #if RELEASE
        return true
        #else
        return false
        #endif
    }
    
    public static var isUnderTest: Bool {
        #if DEBUG
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        #else
        return false
        #endif
    }
}
