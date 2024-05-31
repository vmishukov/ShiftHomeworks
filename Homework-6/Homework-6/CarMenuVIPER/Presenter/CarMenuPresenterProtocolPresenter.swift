//
//  SelectCarPresenter.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol CarMenuPresenterProtocol {

}

final class CarMenuPresenterImpl: CarMenuPresenterProtocol {
    
    private weak var ui: CarMenuViewProtocol?
    private let interactor: CarMenuInteractorProtocol
    private let router: CarMenuRouter
    
    init(router: CarMenuRouter, interactor: CarMenuInteractorProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
