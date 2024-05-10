//
//  DetailedViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 07.05.2024.
//

import Foundation
import UIKit

final class DetailedViewController: UIViewController {
    //MARK: - UI
    private lazy var detailedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var detailedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFill
        return label
    }()
    private lazy var detailedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFill
        return label
    }()
    private lazy var detailedStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailedImageView, detailedTitleLabel, detailedDescriptionLabel, detailedSourceButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var detailedScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.addSubview(detailedStackView)
        view.addSubview(scrollView)
        return scrollView
    }()
    private lazy var detailedSourceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Источник", for: .normal)
        button.addTarget(self, action: #selector(sourceButtonDidTap), for: .touchDown)
        return button
    }()
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavbar()
        mock()
    }
    //MARK: - Setup UI
    private func setupUI() {
        NSLayoutConstraint.activate([
            detailedScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailedScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailedScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailedScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            detailedStackView.topAnchor.constraint(equalTo: detailedScrollView.topAnchor, constant: 10),
            detailedStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailedStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            detailedStackView.bottomAnchor.constraint(equalTo: detailedScrollView.bottomAnchor, constant: 10),
        ])
        view.backgroundColor = .systemBackground
    }
    private func mock() {
        detailedImageView.image = .pilsner
        detailedTitleLabel.text = "test"
        detailedDescriptionLabel.text = "test testovich"
    }
    //MARK: - OBJC
    @objc
    private func sourceButtonDidTap() {
        let vc = SourceViewController()
        self.present(vc, animated: true)
    }
    //MARK: - Setup navbar
    private func setupNavbar() {
        navigationItem.title = "Детальная информация"
    }
}
