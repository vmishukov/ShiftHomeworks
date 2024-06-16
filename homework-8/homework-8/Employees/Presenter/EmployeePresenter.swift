//
//  EmployeePresenter.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import Foundation

final class EmployeesPresenter {
    
    private weak var view: EmployeesViewProtocol?
    private var dataService: EmployeesDataServiceProtocol
    private var employees: [EmployeeData] = []
    private let companyId: UUID
    
    init(with dataService: EmployeesDataServiceProtocol, companyId: UUID) {
        self.dataService = dataService
        self.companyId = companyId
        self.dataService.delegate = self
    }
    
    func didLoad(ui: EmployeesViewProtocol) {
        self.view = ui
        fetchData()
    }
    
    func addButtonTapped() {
        view?.showAddEmployeeAlert()
    }
    
    func getNumberOfRows() -> Int {
        return employees.count
    }
    
    func getCellForRowAt(indexPath: IndexPath) -> EmployeeData {
        return employees[indexPath.row]
    }
}

private extension EmployeesPresenter {
    func fetchData() {
        guard let employees = dataService.fetchEmployees(at: companyId) else { return }
        self.employees = employees
    }
}

extension EmployeesPresenter: EmployeesDataServiceeDelegate {
    
    func employeesDataService(_: any EmployeesDataServiceProtocol, insert employee: EmployeeData, at indexPath: IndexPath) {
        employees.insert(employee, at: indexPath.row)
        view?.insertRow(at: indexPath.row)
    }
    
    func employeesDataServiceDeleteEmployee(_: any EmployeesDataServiceProtocol, at indexPath: IndexPath) {
        employees.remove(at: indexPath.row)
        view?.deleteRow(at: indexPath.row)
    }
}
