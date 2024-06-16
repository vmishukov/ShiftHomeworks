//
//  CompaniesView.swift
//  Comapanies
//
//  Created by Анна Вертикова on 06.06.2024.
//

import UIKit

class CompaniesView: UIView {
    var addButtonHandler: (()->Void)?
    
    lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(addButtonTapped))
        return button
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.register(CompaniesTableViewCell.self, forCellReuseIdentifier: CompaniesTableViewCell.identifier)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 44
        
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(AppError.requiredInitError)
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func addButtonTapped() {
        addButtonHandler?()
    }
}
