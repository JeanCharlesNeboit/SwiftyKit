//
//  EnvironmentService.swift
//  
//
//  Created by Jean-Charles Neboit on 08/02/2022.
//

import Foundation

public class EnvironmentService {
    // MARK: - Properties
    lazy var environment: [String: String] = ProcessInfo.processInfo.environment
    
    public var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    public var isRelease: Bool {
        #if RELEASE
        return true
        #else
        return false
        #endif
    }
    
    public var isTest: Bool {
        #if DEBUG
        return environment["XCTestConfigurationFilePath"] != nil
        #else
        return false
        #endif
    }
    
    // MARK: - Initialization
    public init() {}
}
