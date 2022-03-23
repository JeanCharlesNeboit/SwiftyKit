//
//  RxSwiftExtension.swift
//  Speech
//
//  Created by Jean-Charles Neboit on 28/07/2021.
//

import RxSwift
import RxCocoa

infix operator <=>

@discardableResult
public func <=> <T>(property: ControlProperty<T>, variable: BehaviorRelay<T>) -> Disposable {
    let variableToProperty = variable.asObservable()
        .bind(to: property)

    let propertyToVariable = property
        .subscribe(
            onNext: { variable.accept($0) },
            onCompleted: { variableToProperty.dispose() }
    )

    return Disposables.create(variableToProperty, propertyToVariable)
}
