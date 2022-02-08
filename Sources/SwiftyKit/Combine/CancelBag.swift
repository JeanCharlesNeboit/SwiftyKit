//
//  CancelBag.swift
//  Montvel
//
//  Created by JC Neboit on 02/11/2021.
//

#if canImport(Combine)
import Foundation
import Combine

@available(iOS 13, *)
public final class CancelBag: Cancellable {
    // MARK: - Properties
    private let lock: NSLock = NSLock()
    private var cancellables: [Cancellable] = []
    
    // MARK: - Initialization
    public init() { }
    
    deinit {
        self.cancel()
    }

    // MARK: -
    internal func add(_ cancellable: Cancellable) {
        self.lock.lock()
        defer { self.lock.unlock() }
        self.cancellables.append(cancellable)
    }
    
    public func cancel() {
        self.lock.lock()
        let cancellables = self.cancellables
        self.cancellables.removeAll()
        self.lock.unlock()
        
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
}

@available(iOS 13, *)
public extension Cancellable {
    func store(in cancellable: CancelBag) {
        cancellable.add(self)
    }
}
#endif
