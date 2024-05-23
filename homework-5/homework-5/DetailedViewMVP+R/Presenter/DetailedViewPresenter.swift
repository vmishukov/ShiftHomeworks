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
    //MARK: - private variables
    private let router: DetailedViewRouter
    private let detailedModel: FeedDetailedModel
    //MARK: - weak var ui
    private weak var ui: DetailedViewProtocol?
    //MARK: - INIT
    init(router: DetailedViewRouter, detailedModel: FeedDetailedModel) {
        self.router = router
        self.detailedModel = detailedModel
    }
}
//MARK: - DetailedViewPresenterProtocol
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
