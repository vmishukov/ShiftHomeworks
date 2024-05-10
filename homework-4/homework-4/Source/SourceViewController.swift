//
//  SourceViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 10.05.2024.
//

import Foundation
import UIKit

final class SourceViewController: UIViewController {
    //MARK: - ui
    private lazy var sourceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Источник"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        view.addSubview(label)
        return label
    }()
    private lazy var sourceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()
    //MARK: - private
    private let source: String
    //MARK: - init
    init(with source: String) {
        self.source = source
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - setup ui
    private func setupUI() {
        NSLayoutConstraint.activate([
            sourceTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            sourceTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            sourceDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            sourceDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            sourceDescriptionLabel.topAnchor.constraint(equalTo: sourceTitleLabel.bottomAnchor, constant: 16),
        ])
        view.backgroundColor = .systemBackground
        sourceDescriptionLabel.text = source
    }
}
