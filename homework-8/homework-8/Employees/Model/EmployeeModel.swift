//
//  EmployeeModel.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation

struct EmployeeModel {
    let id: UUID
    let name: String
    let position: String
    let age: Int?
//    let company: CompanyModel
    
    
}

extension EmployeeModel {
    init(name: String, position: String, age: Int?) {
        self.id = UUID()
        self.name = name
        self.position = position
        self.age = age
    }
}
