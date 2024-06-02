//
//  DetailedViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 07.05.2024.
//

import Foundation
import UIKit

protocol DetailedViewProtocol: AnyObject {
    func set(model: FeedDetailedModel)
}

final class DetailedViewController: UIViewController {

    private let contentView = DetailedView()

    private let presenter: DetailedViewPresenterProtocol

    init(presenter: DetailedViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad(ui: self)
        setupNavbar()
    }
    
    @objc
    private func sourceButtonDidTap() {
        presenter.sourceButtonDidTap()
    }

    private func setupNavbar() {
        navigationItem.title = "Детальная информация"
    }
}

extension DetailedViewController: DetailedViewProtocol {
    func set(model: FeedDetailedModel) {
        contentView.detailedImageView.image = model.image
        contentView.detailedTitleLabel.text = model.title
        contentView.detailedDescriptionLabel.text = model.description
        contentView.detailedSourceButton.addTarget(self, action: #selector(sourceButtonDidTap), for: .touchUpInside)
    }
}
