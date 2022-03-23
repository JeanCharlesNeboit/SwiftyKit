//
//  LoggerService.swift
//  
//
//  Created by Jean-Charles Neboit on 02/02/2022.
//

#if canImport(os)
import os.log

public typealias log = LoggerService

public class LoggerService {
    // MARK: - Log
    public static func message(_ message: String) {
        os_log("%@", log: .default, type: .info, message)
    }
    
    public static func debug(_ message: String) {
        #if DEBUG
        self.message("✅ \(message)")
        #endif
    }
    
    public static func info(_ message: String) {
        self.message("ℹ️ \(message)")
    }
    
    // MARK: - Error
    public static func error(_ message: String) {
        self.message("‼️ \(message)")
    }
    
    public static func error(_ error: Error) {
        self.error(error.localizedDescription)
    }
}
#endif
