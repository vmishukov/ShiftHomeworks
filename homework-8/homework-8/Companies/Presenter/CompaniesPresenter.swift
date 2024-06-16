//
//  CompaniesPresenter.swift
//  Comapanies
//
//  Created by Анна Вертикова on 06.06.2024.
//

import Foundation

final class CompaniesPresenter {
    
    private weak var view: ComapniesViewProtocol?
    private let dataService: CompaniesDataService
    private let router: CompaniesRouter
    private var companies: [CompanyData] = []
    
    init(with dataService: CompaniesDataService, router: CompaniesRouter) {
        self.dataService = dataService
        self.router = router
    }
    
    func didLoad(ui: ComapniesViewProtocol) {
        self.view = ui
        fetchData()
    }
    
    func addButtonTapped() {
        view?.showAddCompanyAlert()
    }
    
    func alertAddButtonDidTapped(with companyName: String) {
        let newCompany = CompanyData(name: companyName)
        dataService.addNewCompany(newCompany)
    }
    
    func didSelectCompany(at index: Int) {
        router.goToEmployees(with: companies[index].id)
    }
    
    func deleteTaped(at index: Int) {
        guard index < companies.count else { return }
        //        let deletedCompany = model.remove(at: index)
        //        ui?.deleteRow(at: index)
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
