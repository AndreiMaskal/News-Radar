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
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                let navigationController = UINavigationController(rootViewController: LoginViewController())
                let window = UIWindow(windowScene: windowScene)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
                self.window = window
            } else {
                let navigationController = UINavigationController(rootViewController: MainTabBarController())
                let window = UIWindow(windowScene: windowScene)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
                self.window = window
            }
        }
        
    }
}

