//
//  RealmService.swift
//  Speech
//
//  Created by Jean-Charles Neboit on 27/03/2021.
//

import Foundation
import SwiftyKit
import RealmSwift

public typealias WriteResult = Result<Void, Error>

public class RealmService {
    // MARK: - Singleton
    public static var `default` = RealmService()
    
    // MARK: - Properties
    private var realm: Realm
    
    // MARK: - Initialization
    public init() {
        do {
            realm = try Realm()
        } catch let error {
            NSLog("Failed to instanciate database: \(error.localizedDescription)")
            fatalError()
        }
    }
    
    convenience init(realm: Realm) {
        self.init()
        self.realm = realm
    }
    
    // MARK: File Path
    public func printDatabaseFilePath() {
        realm.printFilePath()
    }
    
    // MARK: -
    func beginWrite() {
        if realm.isInWriteTransaction == false {
            realm.beginWrite()
        }
    }
    
    func cancelWrite() {
        if realm.isInWriteTransaction == true {
            realm.cancelWrite()
        }
    }
    
    func commitWrite() throws {
        if realm.isInWriteTransaction == true {
            try realm.commitWrite()
        }
    }
    
    func commit(completion: ((WriteResult) -> Void)?) {
        perform(transaction: commitWrite, completion: completion)
    }
    
    public func write(block: () -> Void, completion: ((WriteResult) -> Void)? = nil) {
        let write: (() throws -> Void) = {
            try self.realm.write(block)
        }
        perform(transaction: write, completion: completion)
    }
    
    private func perform(transaction: (() throws -> Void), completion: ((WriteResult) -> Void)?) {
        do {
            try transaction()
            completion?(.success(()))
        } catch let error {
            NSLog("❌ Transaction could not be written. (\(error.localizedDescription))")
            completion?(.failure(error))
        }
    }
    
    // MARK: - Request
    public func all<T>(_ type: T.Type) -> Results<T> where T: RealmSwift.Object {
        return realm.objects(type)
    }
    
    public func addObject<T: Object>(_ object: T, completion: ((WriteResult) -> Void)? = nil) {
        addObjects([object], completion: completion)
    }
    
    public func addObjects<T: Object>(_ objects: [T], completion: ((WriteResult) -> Void)? = nil) {
        beginWrite()
        realm.add(objects, update: .all)
        commit(completion: completion)
    }
    
    public func deleteObject<T: Object>(_ object: T, cascade: Bool = false, completion: ((WriteResult) -> Void)? = nil) {
        deleteObjects([object], cascade: cascade, completion: completion)
    }
    
    public func deleteObjects<T: Object>(_ objects: [T], cascade: Bool = false, completion: ((WriteResult) -> Void)? = nil) {
        beginWrite()
        if cascade {
            objects.forEach { realm.deleteCascade($0) }
        } else {
            realm.delete(objects)
        }
        commit(completion: completion)
    }
}
