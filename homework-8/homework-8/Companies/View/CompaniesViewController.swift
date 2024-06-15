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
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = contentView.addButton
    }
}

extension CompaniesViewController: ComapniesViewProtocol {
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
