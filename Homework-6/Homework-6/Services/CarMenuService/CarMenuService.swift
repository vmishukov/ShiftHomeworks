//
//  CarMenuService.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol CarMenuServiceProtocol {
    func getCarList(completion: @escaping([CarMenuDTO]) -> Void)
}

final class CarMenuServiceImpl: CarMenuServiceProtocol {
    
    func getCarList(completion: @escaping ([CarMenuDTO]) -> Void) {
        DispatchQueue.main.async {
            completion(
                [
                    CarMenuDTO(id: 23, name: "Toyota"),
                    CarMenuDTO(id: 2, name: "Nissan"),
                    CarMenuDTO(id: 3, name: "Kia"),
                ]
            )
        }
    }
}
