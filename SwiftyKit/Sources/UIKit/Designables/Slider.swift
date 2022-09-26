//
//  Slider.swift
//  
//
//  Created by Jean-Charles Neboit on 13/04/2021.
//
// https://stackoverflow.com/questions/35452185/how-can-i-make-a-uislider-with-step-value

#if os(iOS) && canImport(UIKit)
import UIKit

@IBDesignable
public class Slider: UISlider {
    // MARK: Properties
    @IBInspectable
    public var step: Float = 0
    
    @IBInspectable
    public var showStepIndicator: Bool = true
    
    public var stepable: Bool {
        step != 0
    }
    
    public var numberOfStep: Int {
        return Int((maximumValue - minimumValue) / step) + 1
    }
}
#endif
