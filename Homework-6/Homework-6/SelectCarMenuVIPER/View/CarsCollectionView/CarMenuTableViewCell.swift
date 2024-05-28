//
//  Select .swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

final class CarMenuTableViewCell: UITableViewCell {
    //MARK: - setup font
    //MARK: - identifier
    static let identifier = String(describing: CarMenuTableViewCell.self)
    //MARK: - UI
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let carMakeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CarMenuTableViewCellFonts.carMake

        return label
    }()
    private let carSelectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CarMenuTableViewCellFonts.carSelect
        return label
    }()
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUiStub()
        setupConstraits()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setup ui
    func setupUiStub() {
        contentView.addSubview(iconImage)
        contentView.addSubview(carMakeLabel)
        contentView.addSubview(carSelectLabel)
        carMakeLabel.text = "BMV"
        carSelectLabel.text = "Select"
        iconImage.image = .icon
    }
    //MARK: - setup constraits
    func setupConstraits() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 40),
        ])
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            iconImage.heightAnchor.constraint(equalToConstant: 16),
            iconImage.widthAnchor.constraint(equalToConstant: 16),
        ])
        NSLayoutConstraint.activate([
            carMakeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            carMakeLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            carSelectLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carSelectLabel.topAnchor.constraint(equalTo: carMakeLabel.topAnchor),
        ])
    }
}
