//
//  SceneDelegate.swift
//  News_Radar
//
//  Created by Andrei Maskal on 27/10/2022.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private var splashPresenter: SplashPresenterDescription? = SplashPresenter()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        splashPresenter?.present(window: window)
        window.makeKeyAndVisible()
    
        self.window = window
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.splashPresenter?.dismiss(complition: { [weak self] in
                self?.splashPresenter = nil
                
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user == nil {
                        let navigationController = UINavigationController(rootViewController: LoginViewController())
                        let window = UIWindow(windowScene: windowScene)
                        window.rootViewController = navigationController
                        window.makeKeyAndVisible()
                        self?.window = window
                    } else {
                        let navigationController = UINavigationController(rootViewController: MainTabBarController())
                        let window = UIWindow(windowScene: windowScene)
                        window.rootViewController = navigationController
                        window.makeKeyAndVisible()
                        self?.window = window
                    }
                }
            })
        }
    }
}

