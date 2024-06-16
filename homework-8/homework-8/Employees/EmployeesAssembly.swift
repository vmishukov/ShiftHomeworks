//
//  EmployeesAssembly.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import UIKit

enum EmployeesAssembly {
    
    struct Dependencies {
        let navigationController: UINavigationController
        let dataService: EmployeesDataServiceProtocol
    }
    
    struct Parameters {
        let companyId: UUID
    }
    
    static func makeModule(with dependencies: Dependencies, parameters: Parameters) -> UIViewController {
        let presenter = EmployeesPresenter(with: dependencies.dataService, companyId: parameters.companyId)
        let viewController = EmployeesViewController(presenter: presenter)
       
        return viewController
    }
}
