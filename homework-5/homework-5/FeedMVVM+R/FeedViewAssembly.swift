//
//  FeedViewAssembly.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation
import UIKit

final class FeedViewAssembly {
    //MARK: - DEPENDENCIES
    struct Dependencies {
        let navigationController: UINavigationController
    }
    //MARK: - make module
    static func makeModule(dependencies: Dependencies) -> UIViewController {
        let feedModel = FeedModel()
        let feedRouter = FeedViewRouter(navigationController: dependencies.navigationController)
        let feedViewModel = FeedViewModel(router: feedRouter, model: feedModel)
        let viewController = FeedViewController(viewModel: feedViewModel)
        return viewController
    }
}
