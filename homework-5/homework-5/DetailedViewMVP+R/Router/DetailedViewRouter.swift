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
    //MARK: - init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    //MARK: - public func
    func showSourceScreen() {
        let dependencies = SourceViewAssembly.Dependencies(sourceLink: "")
        navigationController.present(SourceViewAssembly.makeModule(with: dependencies), animated: true)
    }
}
