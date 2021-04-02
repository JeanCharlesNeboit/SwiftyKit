//
//  UIStackViewExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 01/04/2021.
//

#if canImport(UIKit)
import UIKit

public extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func addArrangedSubview(_ views: [UIView]) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
#endif
