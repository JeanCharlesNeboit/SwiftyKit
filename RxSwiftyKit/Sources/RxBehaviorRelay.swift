//
//  RxBehaviorRelay.swift
//  Speech
//
//  Created by Jean-Charles Neboit on 22/03/2022.
//

import Foundation
import RxSwift
import RxRelay

@propertyWrapper
public class RxBehaviorRelay<T> {
    // MARK: Properties
    private let disposeBag = DisposeBag()
    private var behaviorRelay: BehaviorRelay<T>
    private var value: T

    public var wrappedValue: T {
        get {
            value
        } set {
            value = newValue
            behaviorRelay.accept(newValue)
        }
    }
    
    public var projectedValue: BehaviorRelay<T> {
        behaviorRelay
    }

    // MARK: Initialization
    public init(wrappedValue: T) {
        self.value = wrappedValue
        self.behaviorRelay = BehaviorRelay<T>(value: wrappedValue)
        behaviorRelay.subscribe(onNext: { [weak self] newValue in
            self?.value = newValue
        }).disposed(by: disposeBag)
    }
}
