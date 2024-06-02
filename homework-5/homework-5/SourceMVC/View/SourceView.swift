//
//  SourceView.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 20.05.2024.
//

import Foundation
import UIKit

final class SourceView: UIView {

    let sourceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Источник"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let sourceDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SourceView {
    
    private func setupUI() {
        addSubview(sourceTitleLabel)
        addSubview(sourceDescriptionTextView)
        backgroundColor = .systemBackground
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sourceTitleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            sourceTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            sourceDescriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            sourceDescriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            sourceDescriptionTextView.topAnchor.constraint(equalTo: sourceTitleLabel.bottomAnchor, constant: 16),
            sourceDescriptionTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
