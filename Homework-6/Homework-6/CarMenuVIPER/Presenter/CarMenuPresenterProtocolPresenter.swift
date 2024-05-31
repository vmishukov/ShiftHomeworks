//
//  SelectCarPresenter.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol CarMenuPresenterProtocol {
    func viewDidLoad(ui: CarMenuViewProtocol)
}

final class CarMenuPresenterImpl: CarMenuPresenterProtocol {
    
    private weak var ui: CarMenuViewProtocol?
    private let interactor: CarMenuInteractorProtocol
    private let router: CarMenuRouter
    
    private var carList = [CarModel]()
    
    init(router: CarMenuRouter, interactor: CarMenuInteractorProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(ui: any CarMenuViewProtocol) {
        self.ui = ui
        getCarList()
    }
}

private extension CarMenuPresenterImpl {
    func getCarList() {
        interactor.getCarList{ [weak self] cars in
            self?.carList = cars
            self?.ui?.set(with: cars)
        }
    }
}
