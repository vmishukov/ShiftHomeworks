//
//  CompaniesTableViewCell.swift
//  Comapanies
//
//  Created by Анна Вертикова on 06.06.2024.
//

import UIKit

class CompaniesTableViewCell: UITableViewCell {

    static let identifier = String(describing: CompaniesTableViewCell.self)
    
    lazy var cellStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [companyNameLabel, employeesCountLabel])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var employeesCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CompaniesTableViewCell {
    func setupContent(with company: CompanyModel) {
        companyNameLabel.text = company.name
        employeesCountLabel.text = String(company.employees.count)
    }
    
    func setupLayout() {
        contentView.addSubview(cellStackView)

        NSLayoutConstraint.activate([
            
            cellStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
}
