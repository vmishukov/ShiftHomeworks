//
//  LabelFactory.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 30.04.2024.
//

import UIKit

final class CommonUiFactory {
    static func createTitleLabel(title: String) -> UILabel {
        let label = UILabel()
        label.font = .headline1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.numberOfLines = 0
        return label
    }
    
    static func createBodyLabel(body: String) -> UILabel {
        let label = UILabel()
        label.font = .bodyRegular
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = body
        label.numberOfLines = 0
        return label
    }
    
    static func createDemoImageView(source: UIImage) -> UIImageView {
        let iv = UIImageView()
        iv.image = source
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 400).isActive = true
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }
    
}
