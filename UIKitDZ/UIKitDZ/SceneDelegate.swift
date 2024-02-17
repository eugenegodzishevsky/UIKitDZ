// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let cartVC = CartViewController()

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        let catalogVC = CatalogViewController()
        let profileVC = ProfileViewController()

        let catalogNavVC = UINavigationController(rootViewController: catalogVC)
        let cartNavVC = UINavigationController(rootViewController: cartVC)
        let profileNavVC = UINavigationController(rootViewController: profileVC)

        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [catalogNavVC, cartNavVC, profileNavVC]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}
