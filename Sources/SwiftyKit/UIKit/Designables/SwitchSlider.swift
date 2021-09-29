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
    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    
    // MARK: - Lifecycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        indicatorTrackView?.removeFromSuperview()
        if stepable {
            impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            impactFeedbackGenerator?.prepare()
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
            if newValue != self.value {
                genereateHapticFeedback()
            }
        }
        super.setValue(newValue, animated: animated)
    }
    
    // MARK: - Layout
    private func drawStepsIndicator() {
        let trackSize = trackRect(forBounds: bounds)
            
        let thumbSize = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value).size
        let thumbWidth = thumbSize.width
        let thumbHeight = thumbSize.height
        
        let width = bounds.width - thumbWidth
        let trackHeight = trackSize.height
        
        let indicatorHeight = thumbHeight * 1/3
        let indicatorWidth = trackHeight
        
        let indicatorTrackViewY = trackSize.minY - (indicatorHeight/2 - trackHeight/2)
        let indicatorTrackView = UIView(frame: .init(x: thumbWidth/2, y: indicatorTrackViewY, width: width, height: indicatorHeight))
        
        let trackView = UIView(frame: .init(x: indicatorWidth, y: indicatorHeight/2 - trackHeight/2, width: width - indicatorWidth, height: trackHeight))
        trackView.backgroundColor = trackColor
        indicatorTrackView.addSubview(trackView)
        
        for i in 0..<numberOfStep {
            let x = CGFloat(i) * width/CGFloat(numberOfStep - 1)
            let indicatorView = VerticalCapsule(frame: .init(x: x, y: 0, width: trackHeight, height: indicatorHeight))
            indicatorView.backgroundColor = trackColor
            indicatorTrackView.addSubview(indicatorView)
        }
        
        insertSubview(indicatorTrackView, at: 0)
        self.indicatorTrackView = indicatorTrackView
    }
    
    // MARK: - Haptic Feedback
    private func genereateHapticFeedback() {
        impactFeedbackGenerator?.impactOccurred()
    }
}
#endif
