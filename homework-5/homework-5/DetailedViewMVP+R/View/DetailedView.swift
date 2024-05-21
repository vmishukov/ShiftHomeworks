//
//  DetailedView.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 20.05.2024.
//

import Foundation
import UIKit

final class DetailedView: UIView {
    //MARK: - UI
    let detailedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let detailedTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    let detailedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    lazy var detailedStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailedImageView, detailedTitleLabel, detailedDescriptionLabel, detailedSourceButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let detailedScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isDirectionalLockEnabled = true
        return scrollView
    }()
    
    let detailedSourceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Источник", for: .normal)
        return button
    }()
    
    //MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - SETUP
extension DetailedView {
    func setupUI() {
        addSubview(detailedScrollView)
        detailedScrollView.addSubview(detailedStackView)
        backgroundColor = .systemBackground
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            detailedScrollView.topAnchor.constraint(equalTo: topAnchor),
            detailedScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailedScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailedScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            detailedStackView.topAnchor.constraint(equalTo: detailedScrollView.topAnchor, constant: 10),
            detailedStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            detailedStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            detailedStackView.bottomAnchor.constraint(equalTo: detailedScrollView.bottomAnchor, constant: 10),
        ])
    }
}
