//
//  UploaderTableViewCell.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 12.06.2024.
//

import Foundation
import UIKit

final class UploaderTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: UploaderTableViewCell.self)
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
        setupConstraints()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(with iamge: UIImage) {
        cellImage.image = iamge
    }
}

private extension UploaderTableViewCell {
    
    func setupUi() {
        contentView.addSubview(cellImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}
