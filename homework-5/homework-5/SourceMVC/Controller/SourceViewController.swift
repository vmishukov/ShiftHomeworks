//
//  SourceViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 10.05.2024.
//

import Foundation
import UIKit

final class SourceViewController: UIViewController {
    //MARK: - ui
    private let contentView = SourceView()
    //MARK: - private
    private let source: String
    //MARK: - init
    init(with source: String) {
        self.source = source
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - lifecycle
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - setup ui
    private func setupUI() {
        contentView.sourceDescriptionTextView.text = source
    }
}
