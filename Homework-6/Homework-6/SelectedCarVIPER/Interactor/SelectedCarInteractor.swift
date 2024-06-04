//
//  SelectedCarInteractor.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol SelectedCarInteractorProtocol {
    func getSelectedCar(by id: Int, completion: @escaping (SelectedCarModel?) -> Void)
}

final class SelectedCarInteractorImpl: SelectedCarInteractorProtocol {
    
    private let service: SelectedCarServiceProtocol
    
    init(service: SelectedCarServiceProtocol) {
        self.service = service
    }
    
    func getSelectedCar(by id: Int, completion: @escaping (SelectedCarModel?) -> Void) {
        service.getCarData(by: id, completion: { result in
            var modelTypes = [SelectedCarModelTypes]()
            guard let result = result else { return }
            let count: Int = result.bodyTypes.count
            for i in 0...count-1 {
                modelTypes.append(SelectedCarModelTypes(bodyType: result.bodyTypes[i],
                                                        image: result.images[i],
                                                        price: result.prices[i])
                )
            }
            let selectedCarModel = SelectedCarModel(carModelId: result.id, modelTypes: modelTypes)
            completion(selectedCarModel)
        })
    }
}
