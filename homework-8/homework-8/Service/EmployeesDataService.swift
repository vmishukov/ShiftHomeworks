//
//  EmployeesDataService.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import Foundation

struct EmployeeServiceData {
    let name: String
    let position: String
    let age: Int?
}

protocol EmployeesDataServiceeDelegate: AnyObject {
    
    func employeesDataService(_: any EmployeesDataServiceProtocol, insert employee: EmployeeData, at indexPath: IndexPath)
    
    func employeesDataServiceDeleteEmployee(_: any EmployeesDataServiceProtocol, at indexPath: IndexPath)
}

protocol EmployeesDataServiceProtocol {
    
    var delegate: EmployeesDataServiceeDelegate? { get set }
    func addNew(employee: EmployeeServiceData, at companyUuid: UUID)
    func deleteEmployee(by uuid: UUID, at companyUuid: UUID)
    func fetchEmployees(at companyUuid: UUID) -> [EmployeeData]?
}

final class EmployeesDataService: EmployeesDataServiceProtocol {
    
    weak var delegate: EmployeesDataServiceeDelegate?
    private var dataStore: EmployeesDataStoreProtocol
    
    init(dataStore: EmployeesDataStoreProtocol) {
        self.dataStore = dataStore
        self.dataStore.delegate = self
    }
    
    func addNew(employee: EmployeeServiceData, at companyUuid: UUID) {
        do {
            try dataStore.addNew(employee: employee, at: companyUuid)
        } catch {
            assertionFailure("\(error)")
        }
    }
    
    func deleteEmployee(by uuid: UUID, at companyUuid: UUID) {
        do {
            try dataStore.deleteEmployee(by: uuid, at: companyUuid)
        } catch {
            assertionFailure("\(error)")
        }
    }
    
    func fetchEmployees(at companyUuid: UUID) -> [EmployeeData]? {
        do {
            guard let employeesData = try dataStore.fetchEmployees(at: companyUuid) else { return nil }
            let employees = employeesData.map {
                EmployeeData(id: $0.uid ?? UUID(),
                             name: $0.name ?? "errorName",
                             position: $0.position ?? "errorPosition",
                             age: $0.age as? Int)
            }
            return employees
            
        } catch {
            assertionFailure("\(error)")
        }
        return nil
    }
}

extension EmployeesDataService: EmployeesDataStoreDelegate {
    
    func employeesDataStore(_: any EmployeesDataStoreProtocol, insert employee: Employee, at indexPath: IndexPath) {
        
    }
    
    func employeesDataStoreDeleteEmployee(_: any EmployeesDataStoreProtocol, at indexPath: IndexPath) {
        
    }
}
