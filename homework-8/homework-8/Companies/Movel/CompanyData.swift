//
//  CompanyModel.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation

struct CompanyData {
    let id: UUID
    let name: String
    let employees: [EmployeeData]?
    
}

extension CompanyData {
    
    init(uuid: UUID, name: String, employees: [EmployeeData]? = nil) {
        self.id = uuid
        self.name = name
        self.employees = employees
    }
}

