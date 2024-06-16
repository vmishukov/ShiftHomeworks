//
//  EmployeeModel.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation

struct EmployeeData {
    let id: UUID
    let name: String
    let position: String
    let age: Int?
//    let company: CompanyModel
    
    
}

extension EmployeeData {
    init(name: String, position: String, age: Int? = nil) {
        self.id = UUID()
        self.name = name
        self.position = position
        self.age = age
    }
}
