//
//  CompanyModel.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation

struct CompanyModel {
    let id: UUID
    let name: String
    let employees: [EmployeeModel]
    
}

extension CompanyModel {
    
    init(name: String, employees: [EmployeeModel]) {
        self.id = UUID()
        self.name = name
        self.employees = employees
    }
}

