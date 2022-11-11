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
        Thread.sleep(forTimeInterval: 1.0)
        return true
    }
}

