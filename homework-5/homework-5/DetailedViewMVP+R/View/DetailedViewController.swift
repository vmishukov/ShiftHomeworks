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
    //MARK: - UI
    private let contentView = DetailedView()
    //MARK: - private
    private let presenter: DetailedViewPresenterProtocol
    //MARK: - init
    init(presenter: DetailedViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    @available(*,unavailable)
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
        presenter.didLoad(ui: self)
        presenter.setUpModel()
        setupNavbar()
    }
    //MARK: - OBJC
    @objc
    private func sourceButtonDidTap() {
        presenter.showSourceViewScreen()
    }
    //MARK: - Setup navbar
    private func setupNavbar() {
        navigationItem.title = "Детальная информация"
    }
}
//MARK: - DetailedViewProtocol
extension DetailedViewController: DetailedViewProtocol {
    func set(model: FeedDetailedModel) {
        contentView.detailedImageView.image = model.collectionModel.image
        contentView.detailedTitleLabel.text = model.collectionModel.title
        contentView.detailedDescriptionLabel.text = model.description
        contentView.detailedSourceButton.addTarget(self, action: #selector(sourceButtonDidTap), for: .touchUpInside)
    }
}
