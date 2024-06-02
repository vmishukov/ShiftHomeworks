//
//  SceneDelegate.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let dependencies = FeedViewAssembly.Dependencies(navigationController: navigationController)
        let feedViewController = FeedViewAssembly.makeModule(dependencies: dependencies)
        navigationController.viewControllers = [feedViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

