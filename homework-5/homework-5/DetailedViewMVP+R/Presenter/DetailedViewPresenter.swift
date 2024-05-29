//
//  DetailedViewPresenter.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 21.05.2024.
//

import Foundation

protocol DetailedViewPresenterProtocol {
    func didLoad(ui: DetailedViewProtocol)
    func setUpModel()
    func showSourceViewScreen()
}

final class DetailedViewPresenter {

    private let router: DetailedViewRouter
    private let detailedModel: FeedDetailedModel

    private weak var ui: DetailedViewProtocol?

    init(router: DetailedViewRouter, detailedModel: FeedDetailedModel) {
        self.router = router
        self.detailedModel = detailedModel
    }
}

extension DetailedViewPresenter: DetailedViewPresenterProtocol {
    
    func showSourceViewScreen() {
        router.showSourceScreen(with: detailedModel.sourceLink)
    }
    
    func didLoad(ui: any DetailedViewProtocol) {
        self.ui = ui
    }
    
    func setUpModel() {
        ui?.set(model: detailedModel)
    }
}
