//
//  CurrentValueSubject.swift
//  
//
//  Created by Jean-Charles Neboit on 01/02/2022.
//

#if canImport(Combine)
import Combine

@available(iOS 13, *)
@propertyWrapper
public class PublishedDidSet<T> {
    // MARK: - Properties
    private let cancelBag = CancelBag()
    private var currentValueSubject: CurrentValueSubject<T, Never>
    private var value: T

    public var wrappedValue: T {
        get {
            value
        } set {
            value = newValue
            currentValueSubject.send(newValue)
        }
    }
    
    public var projectedValue: CurrentValueSubject<T, Never> {
        currentValueSubject
    }

    // MARK: - Initialization
    public init(wrappedValue: T) {
        self.value = wrappedValue
        self.currentValueSubject = CurrentValueSubject<T, Never>(wrappedValue)
        currentValueSubject.sink(receiveValue: { [weak self] newValue in
            self?.value = newValue
        }).store(in: cancelBag)
    }
}
#endif
