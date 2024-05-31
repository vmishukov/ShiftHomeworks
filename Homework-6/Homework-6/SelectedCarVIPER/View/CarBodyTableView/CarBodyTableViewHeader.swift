//
//  CarMenuTableViewHeadre.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 27.05.2024.
//

import Foundation
import UIKit

final class CarBodyTableViewHeader: UITableViewHeaderFooterView {
    //MARK: - identifier
    static let identifier = String(describing: CarMenuTableViewHeader.self)
    //MARK: - UI
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = CarMenuTableViewCellFonts.carHeader
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraits()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setupUI
    private func setupUI() {
        addSubview(headerLabel)
        headerLabel.text = "Выберите тип кузова"
    }
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
}
