//
//  SceneDelegate.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let viewController = ViewController()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [ viewController ]
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

