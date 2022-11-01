//
//  UIViewController + Exs.swift
//  News_Radar
//
//  Created by Andrei Maskal on 01/11/2022.
//

import UIKit

extension UIViewController {
    func setupTabBar(title: String, imageName: String, tag: Int) {
        tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), tag: tag)
        view.backgroundColor = .systemBackground
    }
}
