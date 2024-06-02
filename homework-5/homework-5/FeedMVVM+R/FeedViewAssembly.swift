//
//  FeedViewAssembly.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation
import UIKit

final class FeedViewAssembly {
    
    struct Dependencies {
        let navigationController: UINavigationController
    }

    static func makeModule(dependencies: Dependencies) -> UIViewController {
        let networkManager = NetworkClient()
        let feedModel = FeedModel(networkManager: networkManager)
        let feedRouter = FeedViewRouter(navigationController: dependencies.navigationController)
        let feedViewModel = FeedViewModel(router: feedRouter, model: feedModel)
        let viewController = FeedViewController(viewModel: feedViewModel)
        return viewController
    }
}
