//
//  TabViewController.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

final class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().unselectedItemTintColor = UIColor(white: 1, alpha: 0.5)
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().isTranslucent = true
        setupViewControllers()
    }
    
    func setupViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: MainViewController(), tabTitle: "Main", tabImage: "main"),
            wrapInNavigationController(with: SettingsViewController(), tabTitle: "Settings", tabImage: "settings"),
            wrapInNavigationController(with: HistoryViewController(), tabTitle: "History", tabImage: "history"),
        ]
    }

    func wrapInNavigationController(with rootViewController: UIViewController, tabTitle: String, tabImage: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = UIImage(named: tabImage)
        navigationController.navigationBar.isHidden = true
        rootViewController.navigationController?.title = tabTitle
        return navigationController
    }
    
}
