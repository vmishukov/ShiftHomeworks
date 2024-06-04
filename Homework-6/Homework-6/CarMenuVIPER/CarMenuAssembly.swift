//
//  SelectCarAssembly.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation
import UIKit

enum CarMenuAssembly {
    
    struct Dependencies {
        let navigationController: UINavigationController
        let carMenuService: CarMenuServiceProtocol
    }
    
    static func makeModule(dependencies: Dependencies) -> UIViewController {
        let interactor = CarMenuInteractorImpl(carMenuServiuce: dependencies.carMenuService)
        let router = CarMenuRouter(navigationController: dependencies.navigationController)
        let presenter = CarMenuPresenterImpl(router: router, interactor: interactor)
        let viewController = CarMenuViewController(presenter: presenter)
        return viewController
    }
}
