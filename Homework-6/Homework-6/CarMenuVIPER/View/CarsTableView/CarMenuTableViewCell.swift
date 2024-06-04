//
//  Select .swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

final class CarMenuTableViewCell: UITableViewCell {

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
    private let carSelectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ProjectFonts.carSelect
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraits()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with carModel: String) {
        carMakeLabel.text = carModel
    }

    private func setupUI() {
        
        contentView.addSubview(iconImage)
        contentView.addSubview(carMakeLabel)
        contentView.addSubview(carSelectLabel)
        carSelectLabel.text = "Select"
        iconImage.image = .icon
         
    }

   private func setupConstraits() {

        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            iconImage.heightAnchor.constraint(equalToConstant: 16),
            iconImage.widthAnchor.constraint(equalToConstant: 16),
        ])
      
        NSLayoutConstraint.activate([
            carMakeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            carMakeLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            carSelectLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            carSelectLabel.topAnchor.constraint(equalTo: carMakeLabel.topAnchor),
        ])
    }
}
