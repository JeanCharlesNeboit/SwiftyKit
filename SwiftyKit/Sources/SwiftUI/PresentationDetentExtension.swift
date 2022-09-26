//
//  PresentationDetentExtension.swift
//  
//
//  Created by Jean-Charles Neboit on 14/09/2022.
//

import SwiftUI

@available(iOS 16.0, *)
extension Set where Element == PresentationDetent {
    func withLarge() -> Set<PresentationDetent> {
        var detent = self
        detent.insert(.large)
        return detent
    }
}
