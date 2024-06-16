//
//  CompaniesPresenter.swift
//  Comapanies
//
//  Created by Анна Вертикова on 06.06.2024.
//

import Foundation

protocol CompaniesPresenterDelegate: AnyObject {
  
}

final class CompaniesPresenter {
    
    private weak var view: ComapniesViewProtocol?
    private var dataService: CompaniesDataServiceProtocol
    private let router: CompaniesRouter
    private var companies: [CompanyData] = []
    
    init(with dataService: CompaniesDataServiceProtocol, router: CompaniesRouter) {
        self.dataService = dataService
        self.router = router
        self.dataService.delegate = self
    }
    
    func didLoad(ui: ComapniesViewProtocol) {
        self.view = ui
       
        fetchData()
    }
    
    func addButtonTapped() {
        view?.showAddCompanyAlert()
    }
    
    func alertAddButtonDidTapped(with companyName: String) {
        let newCompany = CompanyData(uuid: UUID(), name: companyName)
        dataService.addNewCompany(newCompany)
    }
    
    func didSelectCompany(at index: Int) {
        router.goToEmployees(with: companies[index].id)
    }
    
    func deleteTaped(at index: Int) {
        guard index < companies.count else { return }
        let companyUuid = companies[index].id
        dataService.deleteCompany(companyUuid)
    }
    
    func getNumberOfRows() -> Int {
        return companies.count
    }
    
    func getCellForRowAt(indexPath: IndexPath) -> CompanyData {
        return companies[indexPath.row]
    }
}

private extension CompaniesPresenter {
    
    func fetchData() {
        companies = dataService.fetchCompanies() ?? []
        print(companies)
    }
}

extension CompaniesPresenter: CompaniesDataServiceDelegate {
    
    func companiesDataService(_: any CompaniesDataServiceProtocol, insert company: CompanyData, at indexPath: IndexPath) {
        companies.insert(company, at: indexPath.row)
        view?.insertRow(at: indexPath.row)
    }
    
    func companiesDataServiceDeleteCompany(_: any CompaniesDataServiceProtocol, at indexPath: IndexPath) {
        companies.remove(at: indexPath.row)
        view?.deleteRow(at: indexPath.row)
    }

}
