//
//  UIWindow + Ext.swift
//  News_Radar
//
//  Created by Andrei Maskal on 20/11/2022.
//

import UIKit

extension UIWindow {
    func switchRootViewController(to viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: AnimationOptions = .transitionFlipFromLeft) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        })
    }
}
