//
//  SelectedCarPresenter.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol SelectedCarPresenterProtocol {
    func viewDidLoad(ui: SelectedCarViewProtocol)
    func didTapOnTableCell(with id: Int)
    func calculateButtonDidTapped()
}

final class SelectedCarPresenterImpl: SelectedCarPresenterProtocol {

    weak var ui: SelectedCarViewProtocol?
    private let interactor: SelectedCarInteractorProtocol
    
    private let carId: Int
    private var selectedCarModel: SelectedCarModel?
    private var currentSelectedCellId: Int = 0
    
    init(interactor: SelectedCarInteractorProtocol, carId: Int) {
        self.interactor = interactor
        self.carId = carId
    }
    
    func calculateButtonDidTapped() {
        updatePrice(with: currentSelectedCellId)
    }
    
    func viewDidLoad(ui: SelectedCarViewProtocol) {
        self.ui = ui
        loadSelectedCarModel()
    }
    
    func didTapOnTableCell(with id: Int) {
        ui?.setSelectedCell(with: id)
        currentSelectedCellId = id
        updateCarImage(with: id)
    }
    
    private func updatePrice(with id: Int) {
        if let selectedCarModel = selectedCarModel {
            if id < selectedCarModel.modelTypes.count{
                let price = selectedCarModel.modelTypes[id].price
                ui?.setPrice(amount: price)
            }
        }
    }
    
    private func updateCarImage(with id: Int) {
        if let selectedCarModel = selectedCarModel {
            if id < selectedCarModel.modelTypes.count{
                let image = selectedCarModel.modelTypes[id].image
                let selectedCarViewModel = SelectedCarViewModel(image: image)
                ui?.setModel(with: selectedCarViewModel)
            }
        }
    }
    
    private func loadSelectedCarModel() {
        interactor.getSelectedCar(by: carId) { [weak self] selectedCarModel in
            self?.selectedCarModel = selectedCarModel
            guard let selectedCarModel = selectedCarModel else { return }
            
            self?.updateCarImage(with: 0)
            self?.updatePrice(with: 0)
            
            let carBodyModel = selectedCarModel.modelTypes.map { SelectedCarBodyTypesDataSource(bodyType: $0.bodyType)}
            self?.ui?.setTable(with: carBodyModel)
        }
    }
}
