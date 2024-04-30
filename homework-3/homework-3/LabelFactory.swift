//
//  LabelFactory.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 30.04.2024.
//

import UIKit

final class LabelFactory {
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
    
}
