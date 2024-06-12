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
        
        let networkClient = AsyncNetworkClient()
        let service = UploaderService(asyncNetwork: networkClient)
        let model = UploaderModel(service: service)
        let presenter = UploaderPresenter(model: model)
        let viewController = UploaderViewController(presenter: presenter)
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [ viewController ]
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

