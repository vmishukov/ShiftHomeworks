//
//  CompaniesViewController.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import UIKit

protocol ComapniesViewProtocol: AnyObject {
    func deleteRow(at index: Int)
    func insertRow(at index: Int)
    func showAddCompanyAlert()
}

class CompaniesViewController: UIViewController {
    
    private let presenter: CompaniesPresenter
    private lazy var contentView = CompaniesView()
    
    init(presenter: CompaniesPresenter) {
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
        setUpContentView()
        setupNavigationBar()
    }
    
    override func loadView() {
        view = contentView
    }
}

private extension CompaniesViewController {
    
    func setUpContentView() {
        contentView.addButtonHandler = { [weak self] in
            guard let self = self else { return }
            
            self.presenter.addButtonTapped()
        }
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = contentView.addButton
    }
}

extension CompaniesViewController: ComapniesViewProtocol {
    
    func showAddCompanyAlert() {
        let alertController = UIAlertController(title: "Add Company", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let addAction = UIAlertAction(title: "Ok", style: .default) { [unowned alertController, weak self] _ in
            guard let text = alertController.textFields?.first?.text,
                  let self = self
            else { return }
            presenter.alertAddButtonDidTapped(with: text)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [unowned alertController, weak self] _ in
            guard let self else { return }
            alertController.dismiss(animated: true)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)

        present(alertController, animated: true)
    }
    
    func insertRow(at index: Int) {
        /*
        contentView.tableView.insertRows(at: [.init(row: index, section: 0)], with: .automatic)
         */
    }
    
    func deleteRow(at index: Int) {
        /*
        let indexPath = IndexPath(row: index, section: 0)
        contentView.tableView.beginUpdates()
        contentView.tableView.deleteRows(at: [indexPath], with: .automatic)
        contentView.tableView.endUpdates()
         */
    }
}

extension CompaniesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCompany(at: indexPath.row)
    }
    
}

extension CompaniesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CompaniesTableViewCell.identifier, for: indexPath) as? CompaniesTableViewCell {
            let company = presenter.getCellForRowAt(indexPath: indexPath)
            cell.setupContent(with: company)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            presenter.deleteTaped(at: indexPath.row)
        }
    }
}
