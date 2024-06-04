//
//  SelectCarInteractor.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol CarMenuInteractorProtocol {
    func getCarList(completion: @escaping([CarModel]) -> Void)
}

final class CarMenuInteractorImpl: CarMenuInteractorProtocol {
    
    let carMenuService: CarMenuServiceProtocol
    
    init(carMenuServiuce: CarMenuServiceProtocol) {
        self.carMenuService = carMenuServiuce
    }
    
    func getCarList(completion: @escaping ([CarModel]) -> Void) {
        carMenuService.getCarList {
            carModelDTO in
            completion(carModelDTO.map{CarModel(with: $0)})
        }
    }
}
