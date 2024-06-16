//
//  EmployeesViewController.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import Foundation
import UIKit

protocol EmployeesViewProtocol: AnyObject {
    func deleteRow(at index: Int)
    func insertRow(at index: Int)
    func showAddEmployeeAlert()
}

class EmployeesViewController: UIViewController {
    
    private let presenter: EmployeesPresenter
    private lazy var contentView = EmployeesView()
    
    init(presenter: EmployeesPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(AppError.requiredInitError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad(ui: self)
        setAddButtonTappedEvent()
        setupNavigationBar()
    }
    
    override func loadView() {
        view = contentView
        setupTableViewDataSource()
    }
}

private extension EmployeesViewController {
    
    func setAddButtonTappedEvent() {
        contentView.addButtonHandler = { [weak self] in
            self?.presenter.addButtonTapped()
        }
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Companies"
        navigationItem.rightBarButtonItem = contentView.addButton
    }
    
    func setupTableViewDataSource() {
        contentView.tableView.dataSource = self
    }
}

extension EmployeesViewController: EmployeesViewProtocol {
    
    func deleteRow(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        contentView.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func insertRow(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        contentView.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func showAddEmployeeAlert() {
        
        let alertController = UIAlertController(title: "Add employee", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Имя сотрудника"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Позиция сотрудника"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Возраст сотрудника"
        }
        
        let addAction = UIAlertAction(title: "Ok", style: .default) { [unowned alertController, weak self] _ in
            guard let self = self,
                  let name = alertController.textFields?.first?.text,
                  let position = alertController.textFields?[0].text,
                    
            else { return }
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        present(alertController, animated: true)
    }
}

extension EmployeesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesTableViewCell.identifier, for: indexPath) as? EmployeesTableViewCell {
            let employee = presenter.getCellForRowAt(indexPath: indexPath)
            cell.setupContent(with: employee)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
}
