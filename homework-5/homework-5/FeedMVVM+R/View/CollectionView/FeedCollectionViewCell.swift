//
//  FeedCollectionViewCell.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import Foundation
import UIKit

final class FeedCollectionViewCell: UICollectionViewCell {
    //MARK: - IDENTIFIER
    static let identifier = String(describing: FeedCollectionViewCell.self)
    //MARK: - UI
    private lazy var feedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private lazy var feedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var feedStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [feedImageView,feedLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        contentView.addSubview(stackView)
        return stackView
    }()
    //MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - public func
    func setupData(with model: FeedViewData) {
        feedImageView.image = model.image
        feedLabel.text = model.title
    }
    //MARK: - SETUP
    private func setupUI() {
        NSLayoutConstraint.activate([
            feedStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            feedStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            feedStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            feedStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            feedImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
        ])
        contentView.backgroundColor = .systemFill
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
}
