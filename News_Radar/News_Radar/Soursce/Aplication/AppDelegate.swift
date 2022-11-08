//
//  AppDelegate.swift
//  News_Radar
//
//  Created by Andrei Maskal on 27/10/2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
        
    }
}

//    @objc func setScreenLogin() {
//
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if user == nil {
//                self.navigationController?.pushViewController(LoginViewController(), animated: true)
//                self.navigationController?.navigationBar.tintColor = Color.grey.color
//            } else {
//                self.navigationController?.pushViewController(MainTabBarController(), animated: true)
//                self.navigationController?.isNavigationBarHidden = true
//            }
//        }
//    }
