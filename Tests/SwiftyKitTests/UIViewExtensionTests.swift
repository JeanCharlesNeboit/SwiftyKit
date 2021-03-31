//
//  UIViewExtensionTests.swift
//  SwiftyKitTests
//
//  Created by Jean-Charles Neboit on 31/03/2021.
//

#if canImport(UIKit)
import XCTest
@testable import SwiftyKit

class UIViewExtensionTests: XCTestCase {
    func testAddShadow() {
        /// Given
        let view = UIView()
        
        /// When
        view.addShadow(color: .red, opacity: 1, offset: .zero, radius: 10)
        
        /// Then
        XCTAssertEqual(view.layer.shadowColor, UIColor.red.cgColor)
        XCTAssertEqual(view.layer.shadowOpacity, 1)
        XCTAssertEqual(view.layer.shadowOffset, .zero)
        XCTAssertEqual(view.layer.shadowRadius, 10)
    }
}
#endif
