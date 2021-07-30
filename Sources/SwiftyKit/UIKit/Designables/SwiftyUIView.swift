//
//  SwiftyUIView.swift
//  
//
//  Created by Jean-Charles Neboit on 08/04/2021.
//

#if canImport(UIKit)
import UIKit

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
    public var borderColor: UIColor? = nil {
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
    
//    // MARK: - Highlight
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        setHighlight(true)
//    }
//    
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        setHighlight(false)
//    }
//    
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        setHighlight(false)
//    }
//    
//    private func setHighlight(_ isHighlight: Bool) {
//        DispatchQueue.main.async {
////            self.backgroundColor = UIColor.white
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
//                if #available(iOS 13.0, tvOS 13.0, *) {
//                    self.backgroundColor = isHighlight ? UIColor.opaqueSeparator : .white
//                } else {
//                    self.backgroundColor = isHighlight ? UIColor.lightGray : .white
//                }
//            }, completion: nil)
//        }
//    }
}
#endif
