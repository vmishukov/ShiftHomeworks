//
//  CompaniesPresenter.swift
//  Comapanies
//
//  Created by Анна Вертикова on 06.06.2024.
//

import CoreData


final class CompaniesPresenter {
    
    private weak var ui: ComapniesViewProtocol?
    private let dataService: CompaniesDataService
    private let router: CompaniesRouter
    private var model: [CompanyModel] = []
    
    
    init(with dataService: CompaniesDataService, router: CompaniesRouter) {
        self.dataService = dataService
        self.router = router
    }
    
    func didLoad(ui: ComapniesViewProtocol) {
        self.ui = ui
        
    }
    
    func fetchData() {
        
    }
    
    func addButtonTapped() {
        /*
         let alertController = UIAlertController(title: "Add Company", message: nil, preferredStyle: .alert)
         alertController.addTextField()
         
         let action = UIAlertAction(title: "Ok", style: .default) { [unowned alertController, weak self] _ in
         guard let text = alertController.textFields?.first?.text,
         let self = self
         else { return }
         
         //  self.dataService.add(company: .init(name: text, employees: []))
         }
         
         alertController.addAction(action)
         ui.present(alertController, animated: true)
         */
    }
    
    func didSelectCompany(at index: Int) {
        router.goToEmployees(with: model[index].id)
    }
    
    func deleteTaped(at index: Int) {
        guard index < model.count else { return }
        //        let deletedCompany = model.remove(at: index)
        //        ui?.deleteRow(at: index)
    }
}

extension CompaniesPresenter {
    func getNumberOfRows() -> Int {
        return model.count
    }
    
    func getCellForRowAt(indexPath: IndexPath) -> CompanyModel {
        return model[indexPath.row]
    }
}
