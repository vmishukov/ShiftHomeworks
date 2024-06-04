//
//  SelectCarRouter.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation
import UIKit

final class CarMenuRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showSelectedCarScreen(with id: Int) {
        let service = SelectedCarServiceImpl()
        let dependencies =  SelectedCarAssembly.Dependencies(selectedCarService: service)
        let parameters = SelectedCarAssembly.Parameters(carId: id)
        let viewController = SelectedCarAssembly.makeModule(dependencies: dependencies, parameters: parameters)
        navigationController.pushViewController(viewController, animated: true)
    }
}
