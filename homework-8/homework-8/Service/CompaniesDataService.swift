//
//  CompaniesDataService.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation

protocol CompaniesDataServiceDelegate: AnyObject {
    
}

protocol CompaniesDataServiceProtocol {
    
    func addNewCompany(_ company: CompanyData)
    func deleteCompany(_ companyId: UUID)
    func fetchCompanies() -> [CompanyData]?
}

final class CompaniesDataService: CompaniesDataServiceProtocol {
    
    private let dataStore: CompaniesDataStoreProtocol
    
    init(dataStore: CompaniesDataStoreProtocol) {
        self.dataStore = dataStore
    }
    
    func addNewCompany(_ company: CompanyData) {
        do {
            try dataStore.addNewCompany(company.name)
        } catch {
            assertionFailure("\(error)")
        }
    }
    
    func deleteCompany(_ companyId: UUID) {
        
    }
    
    func fetchCompanies() -> [CompanyData]? {
        do {
            guard let companiesDataStore = try dataStore.fetchCompanies() else { return nil }
            let companiesData = companiesDataStore.map{ company in
                CompanyData(
                    name: company.name ?? "errorName",
                    employees: company.employees.array(of: Employee.self).map { employee in
                            .init(name: employee.name ?? "errorName"
                                  ,position: employee.position ?? "errorPosition"
                                  ,age: employee.age as? Int
                            )
                    }
                )
            }
            return companiesData
            
        } catch {
            assertionFailure("\(error)")
        }
        return nil
    }
}

