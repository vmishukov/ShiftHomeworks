//
//  SourceViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 10.05.2024.
//

import Foundation
import UIKit

final class SourceViewController: UIViewController {
  
    private let contentView = SourceView()

    private let source: String

    init(with source: String) {
        self.source = source
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        contentView.sourceDescriptionTextView.text = source
    }
}
