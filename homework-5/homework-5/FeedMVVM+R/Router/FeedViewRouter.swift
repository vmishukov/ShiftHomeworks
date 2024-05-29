//
//  FeedViewRouter.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation
import UIKit

final class FeedViewRouter {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showDetailedViewScreen(data: FeedDetailedModel) {
        let dependencies = DetailedViewAssembly.Dependencies(navigationController: navigationController)
        let parameters = DetailedViewAssembly.Parameters(detailedModel: data)
        let vc = DetailedViewAssembly.makeModule(dependencies: dependencies, parameters: parameters)
        navigationController.pushViewController(vc, animated: true)
    }
}
