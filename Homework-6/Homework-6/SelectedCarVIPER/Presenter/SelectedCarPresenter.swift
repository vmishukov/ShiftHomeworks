//
//  SelectedCarPresenter.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol SelectedCarPresenterProtocol {
    func viewDidLoad(ui: SelectedCarViewProtocol)
}

final class SelectedCarPresenterImpl: SelectedCarPresenterProtocol {
    
    weak var ui: SelectedCarViewProtocol?
    private let interactor: SelectedCarInteractorProtocol
    private let carId: Int
    private var selectedCarModel: SelectedCarModel?
    
    init(interactor: SelectedCarInteractorProtocol, carId: Int) {
        self.interactor = interactor
        self.carId = carId
    }
    
    func viewDidLoad(ui: SelectedCarViewProtocol) {
        self.ui = ui
        loadSelectedCarModel()
    }
    
    private func loadSelectedCarModel() {
        interactor.getSelectedCar(by: carId) { [weak self] selectedCarModel in
            self?.selectedCarModel = selectedCarModel
            guard let selectedCarModel = selectedCarModel else { return }

            if let image = selectedCarModel.modelTypes.first?.image {
                let selectedCarViewModel = SelectedCarViewModel(image: image)
                self?.ui?.setModel(with: selectedCarViewModel)
            }
            
            let carBodyModel = selectedCarModel.modelTypes.map { SelectedCarBodyTypesDataSource(bodyType: $0.bodyType)}
            self?.ui?.setTable(with: carBodyModel)
            
            
        }
    }
    
    
    
}
