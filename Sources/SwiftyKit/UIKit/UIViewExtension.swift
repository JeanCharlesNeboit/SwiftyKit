//
//  UIViewExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 29/03/2021.
//

#if canImport(UIKit)
import UIKit

extension UIView {
    public class func loadFromXib<T>() -> T {
        let nibName = String(describing: T.self)
        let views = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        let view = views?.first as! T
        return view
    }
}

extension UIView {
    public func addShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
    
    public func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
#endif
