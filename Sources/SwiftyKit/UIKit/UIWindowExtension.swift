//
//  UIWindowExtension.swift
//  SwiftyKit
//
//  Created by Jean-Charles Neboit on 27/03/2021.
//

#if canImport(UIKit)
import UIKit

extension UIWindow {
    public func set(rootViewController vc: UIViewController, animated: Bool = false, animationOptions: UIView.AnimationOptions = .transitionCrossDissolve) {
         if animated {
            let animations = { [self] in
                let oldState = UIView.areAnimationsEnabled
                
                UIView.setAnimationsEnabled(false)
                rootViewController = vc
                UIView.setAnimationsEnabled(oldState)
            }
            UIView.transition(with: self, duration: 0.2, options: animationOptions, animations: animations)
         } else {
             rootViewController = vc
         }
         makeKeyAndVisible()
     }
}
#endif
