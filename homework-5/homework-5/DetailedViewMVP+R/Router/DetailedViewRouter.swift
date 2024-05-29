//
//  DetailedViewRouter.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 21.05.2024.
//

import Foundation
import UIKit

final class DetailedViewRouter {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showSourceScreen(with sourceLink: String) {
        let parameters = SourceViewAssembly.Parameters(sourceLink: sourceLink)
        navigationController.present(SourceViewAssembly.makeModule(with: parameters), animated: true)
    }
}
