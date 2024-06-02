//
//  Select .swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

final class CarBodyTableViewCell: UITableViewCell {

    static let identifier = String(describing: CarMenuTableViewCell.self)

    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let carMakeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ProjectFonts.carMake

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
        setupConstraits()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(bodyName: String, isChecked: Bool) {
        carMakeLabel.text = bodyName
        if isChecked {
            iconImage.image = .checked
        } else {
            iconImage.image = .uncheked
        }
    }
    
    private func setupUi() {
        contentView.addSubview(iconImage)
        contentView.addSubview(carMakeLabel)
        iconImage.image = .icon
    }
   private func setupConstraits() {

        NSLayoutConstraint.activate([
            carMakeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            carMakeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

        ])
        NSLayoutConstraint.activate([
            iconImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 16),
            iconImage.widthAnchor.constraint(equalToConstant: 16),
        ])
    }
}
