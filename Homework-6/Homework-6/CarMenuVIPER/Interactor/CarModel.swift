//
//  CarModel.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

struct CarModel {
    let carId: Int
    let carModel: String
}

extension CarModel {
    init(with dto: CarMenuDTO) {
        carId = dto.id
        carModel = dto.name
    }
}
