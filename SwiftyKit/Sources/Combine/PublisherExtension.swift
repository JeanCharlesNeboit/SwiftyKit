//
//  File.swift
//  
//
//  Created by Jean-Charles Neboit on 30/06/2022.
//

#if canImport(Combine)
import Combine

@available(iOS 13, *)
extension Publisher {
    public func deferred() -> Deferred<Self> {
        Deferred {
            self
        }
    }
}

@available(iOS 13, *)
public enum AsyncError: Error {
    case finishedWithoutValue
}

@available(iOS 13, *)
extension AnyPublisher {
    public var value: Output {
        get async throws {
            try await withCheckedThrowingContinuation { continuation in
                var cancellable: AnyCancellable?
                var finishedWithoutValue = true

                cancellable = first()
                    .sink { result in
                        switch result {
                        case .finished:
                            if finishedWithoutValue {
                                continuation.resume(throwing: AsyncError.finishedWithoutValue)
                            }
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        }
                        cancellable?.cancel()
                    } receiveValue: { value in
                        finishedWithoutValue = false
                        continuation.resume(with: .success(value))
                    }
            }
        }
    }
}
#endif
