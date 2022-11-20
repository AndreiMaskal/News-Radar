//
//  SplashPresenter.swift
//  News_Radar
//
//  Created by Andrei Maskal on 14/11/2022.
//

import UIKit

protocol SplashPresenterDescription {
    func present(window: UIWindow)
    func dismiss(complition: (() -> Void)?)
}

final class SplashPresenter: SplashPresenterDescription {
    
    lazy var foregroundSplashWindow: UIWindow = {
        let splashWindow = UIWindow()
        splashWindow.windowLevel = .normal + 1
        return splashWindow
    }()
    
    func present(window: UIWindow) {
        foregroundSplashWindow = window
        window.isHidden = false
        window.rootViewController = SplashLaunchScreenViewController()
        let splashViewController = window.rootViewController as? SplashLaunchScreenViewController
        splashViewController?.logoLabel.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 3) {
            
            splashViewController?.logoImageView.transform = CGAffineTransform(scaleX: 1 / 70, y: 1 / 70)
            
            splashViewController?.logoLabel.transform = .identity
        }
        
        splashViewController?.logoLabel.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            splashViewController?.logoLabel.alpha = 1
        }
    }
    
    func dismiss(complition: (() -> Void)?) {
        UIView.animate(withDuration: 1) {
            self.foregroundSplashWindow.alpha = 1
        } completion: { (_) in
            complition?()
        }
    }
}
