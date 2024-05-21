//
//  DetailedViewAssembly.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 21.05.2024.
//

import Foundation
import UIKit

final class DetailedViewAssembly {
    //MARK: - Dependencies
    struct Dependencies {
        let navigationController: UINavigationController
        let detailedModel: FeedDetailedModel
    }
    //MARK: - makeModule
    static func makeModule(with dependencies: Dependencies) -> UIViewController {
        let router = DetailedViewRouter(navigationController: dependencies.navigationController)
        let presenter = DetailedViewPresenter(router: router, detailedModel: dependencies.detailedModel)
        let viewController = DetailedViewController(presenter: presenter)
        return viewController
    }
}
