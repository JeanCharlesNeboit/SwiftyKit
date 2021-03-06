//
//  SwiftyUIView.swift
//  
//
//  Created by Jean-Charles Neboit on 08/04/2021.
//

#if canImport(UIKit)
import UIKit

open class HorizontalCapsule: UIView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
    }
}

open class VerticalCapsule: UIView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width/2
    }
}

@IBDesignable
open class SwiftyUIView: UIView {
    // MARK: - Properties
    static public var DefaultCornerRadius: CGFloat = 0
    
    private var savedBackgroundColor: UIColor?
    open override var backgroundColor: UIColor? {
        didSet {
            savedBackgroundColor = backgroundColor
        }
    }
    
    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        sharedInit()
    }
    
    open func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshBorderColor(value: borderColor)
        refreshBorderWidth(value: borderWidth)
    }
    
    // MARK: - Corner Radius
    @IBInspectable
    public var cornerRadius: CGFloat = DefaultCornerRadius {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    // MARK: - Border Color
    @IBInspectable
    public var borderColor: UIColor? {
        didSet {
            refreshBorderColor(value: borderColor)
        }
    }
    
    func refreshBorderColor(value: UIColor?) {
        layer.borderColor = value?.cgColor
    }
    
    // MARK: - Border Width
    @IBInspectable
    public var borderWidth: CGFloat = 0 {
        didSet {
            refreshBorderWidth(value: borderWidth)
        }
    }
    
    func refreshBorderWidth(value: CGFloat) {
        layer.borderWidth = value
    }
}
#endif
