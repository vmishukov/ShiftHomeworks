//
//  CompaniesDataService.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation

protocol CompaniesDataServiceDelegate: AnyObject {
    
    func companiesDataService(_: any CompaniesDataServiceProtocol, insert company: CompanyData, at indexPath: IndexPath)
    
    func companiesDataServiceDeleteCompany(_: any CompaniesDataServiceProtocol, at indexPath: IndexPath)
}

protocol CompaniesDataServiceProtocol {
    
    var delegate: CompaniesDataServiceDelegate? { get set }
    func addNewCompany(_ company: CompanyData)
    func deleteCompany(_ companyId: UUID)
    func fetchCompanies() -> [CompanyData]?
}

final class CompaniesDataService: CompaniesDataServiceProtocol {
    
    weak var delegate: CompaniesDataServiceDelegate?
    private var dataStore: CompaniesDataStoreProtocol
    
    init(dataStore: CompaniesDataStoreProtocol) {
        self.dataStore = dataStore
        self.dataStore.delegate = self
    }
    
    func addNewCompany(_ company: CompanyData) {
        
        do {
            try dataStore.addNewCompany(company.name, company.id)
        } catch {
            assertionFailure("\(error)")
        }
    }
    
    func deleteCompany(_ companyId: UUID) {
        do {
            try dataStore.deleteCompany(companyId)
        }
        catch {
            assertionFailure("\(error)")
        }
    }
    
    func fetchCompanies() -> [CompanyData]? {
        do {
            guard let companiesDataStore = try dataStore.fetchCompanies() else { return nil }
            let companiesData = companiesDataStore.map{ company in
                CompanyData(
                    uuid: company.uid ?? UUID(),
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

extension CompaniesDataService: CompaniesDataStroreDelegate {
    
    func companiesDataStore(_: any CompaniesDataStoreProtocol, insert company: Company, at indexPath: IndexPath) {
        guard let companyName = company.name, let companyUid = company.uid else { return }
        let companyData = CompanyData(uuid: companyUid, name: companyName)
        delegate?.companiesDataService(self, insert: companyData, at: indexPath)
    }
    
    func companiesDataStoreDeleteCompany(_: any CompaniesDataStoreProtocol, at indexPath: IndexPath) {
        delegate?.companiesDataServiceDeleteCompany(self, at: indexPath)
    }
}
