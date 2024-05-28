//
//  SelectedCarView.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 27.05.2024.
//

import Foundation
import UIKit

final class SelectedCarView: UIView {
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
