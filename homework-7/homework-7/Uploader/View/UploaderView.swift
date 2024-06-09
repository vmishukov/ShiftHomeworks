//
//  UploaderView.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import Foundation
import UIKit

final class UploaderView: UIView {
    
    lazy var uploaderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    lazy var uploaderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Upload", for: .normal)
        return button
    }()
    
    lazy var uploaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Введите изображение"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var uploaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var uoloaderTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let uploaderTableViewDataSource = UploaderTableViewDataSource()
    let uploaderTableViewDelegate = UploadTableViewDelegate()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UploaderView {
    
    func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(uploaderStackView)
        uploaderStackView.addArrangedSubview(uploaderLabel)
        uploaderStackView.addArrangedSubview(uploaderTextField)
        uploaderStackView.addArrangedSubview(uploaderButton)
        
        addSubview(uoloaderTableView)
        uoloaderTableView.delegate = uploaderTableViewDelegate
        uoloaderTableView.dataSource = uploaderTableViewDataSource
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            uploaderStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            uploaderStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            uploaderStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 36),
        ])
        
        NSLayoutConstraint.activate([
            uoloaderTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            uoloaderTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            uoloaderTableView.topAnchor.constraint(equalTo: uploaderStackView.bottomAnchor, constant: 8),
            uoloaderTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
