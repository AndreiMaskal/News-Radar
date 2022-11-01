//
//  MainTabBarController.swift
//  News_Radar
//
//  Created by Andrei Maskal on 27/10/2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties

    private var profileViewController: UIViewController?
    private var newsViewController: UIViewController?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
    }

    // MARK: - Settings -
    
    private func setupHierarchy() {
        setupViewControllers()

        let viewControllers = [
            profileViewController,
            newsViewController,
        ]

        self.viewControllers = viewControllers.map {
            UINavigationController(rootViewController: $0 ?? UIViewController())
        }
    }

    private func setupView() {
        setupTabBarAppearance()
        tabBar.tintColor = Colors.customRed
    }

    // MARK: - Private functions -

    private func setupViewControllers() {
        profileViewController = NewsScreenController()
        profileViewController?.setupTabBar(title: "",
                                        imageName: "newspaper",
                                        tag: 0)

        newsViewController = ProfileScreenController()
        newsViewController?.setupTabBar(title: "",
                                           imageName: "person",
                                           tag: 1)
    }

    private func setupTabBarAppearance() {
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = Color.black.color
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

// MARK: - Colors

extension MainTabBarController {
    enum Colors {
        static let customRed = UIColor(hue: 330/360, saturation: 0.5, brightness: 1, alpha: 1)
    }
}

