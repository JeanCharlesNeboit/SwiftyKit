//
//  SwitchSlider.swift
//  
//
//  Created by Jean-Charles Neboit on 14/04/2021.
//

#if os(iOS) && canImport(UIKit)
import UIKit

@IBDesignable
public class SwitchSlider: Slider {
    // MARK: - Properties
    @IBInspectable
    public var trackColor: UIColor = .lightGray
    
    private var indicatorTrackView: UIView?
    
    // MARK: - Lifecycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        indicatorTrackView?.removeFromSuperview()
        if stepable {
            drawStepsIndicator()
        }
    }
    
    // MARK: - Lifecycle
    public override func awakeFromNib() {
        super.awakeFromNib()
        minimumTrackTintColor = .clear
        maximumTrackTintColor = .clear
    }
    
    // MARK: -
    public override func setValue(_ value: Float, animated: Bool) {
        var newValue = value
        if stepable {
            newValue = round(value / step) * step
        }
        super.setValue(newValue, animated: animated)
    }
    
    // MARK: - Steps indicator
    private func drawStepsIndicator() {
        let trackSize = trackRect(forBounds: bounds)
        //maximumTrackTintColor = UIColor.lightGray
            
        let thumbSize = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value).size
        let thumbWidth = thumbSize.width
        let thumbHeight = thumbSize.height
        
        let width = bounds.width - thumbWidth
        let trackHeight = trackSize.height
        let indicatorHeight = trackSize.height * 2
        
        let indicatorTrackView = UIView(frame: .init(x: thumbWidth/2, y: trackSize.midY - indicatorHeight/2, width: width, height: indicatorHeight))
        
        let trackView = UIView(frame: .init(x: 0, y: trackHeight/2, width: width, height: trackHeight))
        trackView.backgroundColor = trackColor
        indicatorTrackView.addSubview(trackView)
        
        for i in 0..<numberOfStep {
            let x = CGFloat(i) * width/CGFloat(numberOfStep - 1)
            
//            let indicatorView = UIImageView(frame: .init(x: x + thumbWidth/2, y: bounds.midY - indicatorHeight/2, width: 4, height: indicatorHeight))
            let indicatorView = UIView(frame: .init(x: x, y: 0, width: 3, height: indicatorHeight))
            //indicatorView.image = currentMaximumTrackImage
            
            indicatorView.backgroundColor = trackColor
            indicatorTrackView.addSubview(indicatorView)
        }
        
        insertSubview(indicatorTrackView, at: 0)
        self.indicatorTrackView = indicatorTrackView
    }
}
#endif
