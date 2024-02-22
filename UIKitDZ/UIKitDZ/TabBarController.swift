// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Инициализирует  все контроллеры для таб бара
class MainTabBarController: UITabBarController {
    private enum Constants {
        static let homeTabBarName = "Лента"
        static let notificationsTabBarName = "Уведомления"
        static let profileTabBarName = "Профиль"
        static let homeTabBarImage = "home"
        static let notificationsTabBarImage = "notifications"
        static let profileTabBarImage = "profile"
        static let blueColor = "myBlue"
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBars()
        customizeTabBars()
        makeTabBarLine()
    }

    // MARK: - Private Methods

    private func makeTabBarLine() {
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        tabBar.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leftAnchor.constraint(equalTo: tabBar.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: tabBar.rightAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }

    private func customizeTabBars() {
        tabBar.tintColor = UIColor(named: Constants.blueColor)
        tabBar.unselectedItemTintColor = .black
    }

    private func generateTabBars() {
        viewControllers = [
            UINavigationController(
                rootViewController: makeViewControllers(
                    viewController: HomeViewController(),
                    title: Constants.homeTabBarName,
                    image: UIImage(named: Constants.homeTabBarImage)
                )
            ),
            UINavigationController(
                rootViewController: makeViewControllers(
                    viewController: NotificationsViewController(),
                    title: Constants.notificationsTabBarName,
                    image: UIImage(named: Constants.notificationsTabBarImage)
                )
            ),
            UINavigationController(
                rootViewController: makeViewControllers(
                    viewController: ProfileViewController(),
                    title: Constants.profileTabBarName,
                    image: UIImage(named: Constants.profileTabBarImage)
                )
            )
        ]
    }

    private func makeViewControllers(
        viewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
