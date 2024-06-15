//
//  SceneDelegate.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController()
        
        let router = CompaniesRouter(navigationController: navigationController)
        let dataService = CompaniesDataService()
        let presenter = CompaniesPresenter(with: dataService, router: router)
        let viewController = CompaniesViewController(presenter: presenter)
        navigationController.viewControllers = [viewController]
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

