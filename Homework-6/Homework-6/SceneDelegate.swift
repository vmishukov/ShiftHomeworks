//
//  SceneDelegate.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()
        let carMenuService = CarMenuServiceImpl()
        
        let dependencies = CarMenuAssembly.Dependencies(navigationController: navigationController, carMenuService: carMenuService)
        
        let viewController = CarMenuAssembly.makeModule(dependencies: dependencies)
        navigationController.viewControllers = [viewController]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

