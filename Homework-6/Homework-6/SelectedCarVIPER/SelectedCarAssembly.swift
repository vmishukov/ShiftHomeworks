//
//  SelectedCarAssembly.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation
import UIKit

enum SelectedCarAssembly {
    
    struct Parameters {
        let carId: Int
    }
    
    struct Dependencies {
        let selectedCarService: SelectedCarServiceProtocol
    }
    
    static func makeModule(dependencies: Dependencies, parameters: Parameters) -> UIViewController {
        let interactor = SelectedCarInteractorImpl(service: dependencies.selectedCarService)
        let presenter = SelectedCarPresenterImpl(interactor: interactor, carId: parameters.carId)
        let viewController = SelectedCarViewController(presenter: presenter)
        return viewController
    }
}
