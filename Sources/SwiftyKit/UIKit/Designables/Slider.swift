//
//  Slider.swift
//  
//
//  Created by Jean-Charles Neboit on 13/04/2021.
//

#if os(iOS) && canImport(UIKit)
import UIKit

@IBDesignable
public class Slider: UISlider {
    // MARK: - Properties
    @IBInspectable
    var step: Float = 0
    
    // MARK: -
    public override func setValue(_ value: Float, animated: Bool) {
        var newValue = value
        if step != 0 {
            newValue = round((value - minimumValue) / step)
        }
        super.setValue(newValue, animated: animated)
    }
}
#endif
