//
//  CarMenuView.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

final class CarMenuView: UIView {
    
    let carMenuTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CarMenuTableViewCell.self, forCellReuseIdentifier: CarMenuTableViewCell.identifier)
        tableView.register(CarMenuTableViewHeader.self, forHeaderFooterViewReuseIdentifier: CarMenuTableViewHeader.identifier)
        return tableView
    }()
    let carMenuTableViewDataSource = CarMenuTableViewDataSource()
    let carMenuTableViewDelegate = CarMenuTableViewDelegate()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(carMenuTableView)
        setupConstraits()
        carMenuTableView.dataSource = carMenuTableViewDataSource
        carMenuTableView.delegate = carMenuTableViewDelegate
    }
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            carMenuTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            carMenuTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            carMenuTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            carMenuTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
}
