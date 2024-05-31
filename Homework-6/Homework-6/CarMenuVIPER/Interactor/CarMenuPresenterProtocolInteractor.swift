//
//  SelectCarInteractor.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol CarMenuInteractorProtocol {
    
}

final class CarMenuInteractorImpl: CarMenuInteractorProtocol {
    
    let carMenuServiuce: CarMenuServiceProtocol
    
    init(carMenuServiuce: CarMenuServiceProtocol) {
        self.carMenuServiuce = carMenuServiuce
    }
}
