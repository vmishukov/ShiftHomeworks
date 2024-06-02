//
//  SelectedCarView.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 27.05.2024.
//

import Foundation
import UIKit


final class SelectedCarView: UIView {
    
    let selectedСarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let selectedCarPriceLabel: UILabel = {
        let label = UILabel()
        label.font = ProjectFonts.carHeader
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let selectedCarPriceSumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ProjectFonts.carMake
        return label
    }()
    
    let selectedCarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Рассчитать цену", for: .normal)
        button.backgroundColor = ProjectColors.green
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let carBodyTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        if #available(iOS 15.0, *)
        {
            tableView.sectionHeaderTopPadding = 0.0
        }
        tableView.register(CarBodyTableViewCell.self, forCellReuseIdentifier: CarBodyTableViewCell.identifier)
        tableView.register(CarBodyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: CarBodyTableViewHeader.identifier)
        return tableView
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner =  UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    let carBodyTableViewDataSource = CarBodyTableViewDataSource()
    let carBodyTableViewDelegate = CarBodyTableViewDelegate()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        backgroundColor = .systemBackground
        selectedCarPriceLabel.text = "Цена"
        
        carBodyTableView.dataSource = carBodyTableViewDataSource
        carBodyTableView.delegate = carBodyTableViewDelegate
        
   
        
        addSubview(selectedСarImageView)
        addSubview(selectedCarPriceLabel)
        addSubview(selectedCarPriceSumLabel)
        addSubview(selectedCarButton)
        addSubview(carBodyTableView)
        addSubview(spinner)
        
    }
    
    func setUpConstraints() {
        let screenHeight = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            selectedСarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            selectedСarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            selectedСarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            selectedСarImageView.heightAnchor.constraint(equalToConstant: screenHeight * 0.25)
        ])
        NSLayoutConstraint.activate([
            selectedCarPriceLabel.leadingAnchor.constraint(equalTo: selectedСarImageView.leadingAnchor),
            selectedCarPriceLabel.topAnchor.constraint(equalTo: selectedСarImageView.bottomAnchor, constant: 16),
            selectedCarPriceLabel.trailingAnchor.constraint(equalTo: selectedСarImageView.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            selectedCarPriceSumLabel.leadingAnchor.constraint(equalTo: selectedCarPriceLabel.leadingAnchor),
            selectedCarPriceSumLabel.topAnchor.constraint(equalTo: selectedCarPriceLabel.bottomAnchor, constant: 8),
            selectedCarPriceSumLabel.trailingAnchor.constraint(equalTo: selectedCarPriceLabel.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            selectedCarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            selectedCarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            selectedCarButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            selectedCarButton.heightAnchor.constraint(equalToConstant: screenHeight * 0.06)
            
        ])
        NSLayoutConstraint.activate([
            carBodyTableView.topAnchor.constraint(equalTo: selectedCarPriceSumLabel.bottomAnchor, constant: 16),
            carBodyTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carBodyTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carBodyTableView.bottomAnchor.constraint(equalTo: selectedCarButton.topAnchor, constant: -8)
        ])
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
