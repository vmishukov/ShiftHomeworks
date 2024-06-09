//
//  UploaderView.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import Foundation
import UIKit

final class UploaderView: UIView {
    
    lazy var uploaderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var uploaderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}
