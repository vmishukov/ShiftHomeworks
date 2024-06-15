//
//  CompaniesRouter.swift
//  Comapanies
//
//  Created by Анна Вертикова on 06.06.2024.
//

import UIKit

final class CompaniesRouter {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToEmployees(with id: UUID) {
        /*
        let dataService = EmployeesDataService()
        
        let dependencies = EmployeesAssembly.Dependencies (
            navigationController: navigationController,
            dataService: dataService
        )
        
        let parameters = EmployeesAssembly.Parameters(companyId: id)
        
        let viewController = EmployeesAssembly.makeModule(with: dependencies, parameters: parameters)
        navigationController.pushViewController(viewController, animated: true)
         */
    }
}
