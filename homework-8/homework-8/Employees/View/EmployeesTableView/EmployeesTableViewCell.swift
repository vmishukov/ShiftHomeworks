//
//  EmployeesTableViewCell.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {

    static let identifier = String(describing: EmployeesTableViewCell.self)
    
    lazy var cellStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, positionLabel, ageLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var ageLabel: UILabel = {
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

extension EmployeesTableViewCell {
    func setupContent(with employee: EmployeeData) {
        nameLabel.text = employee.name
        positionLabel.text = employee.position
        ageLabel.text = "\(String(describing: employee.age))"
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

