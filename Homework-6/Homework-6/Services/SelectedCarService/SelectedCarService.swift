//
//  SelectedCarService.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 31.05.2024.
//

import Foundation

protocol SelectedCarServiceProtocol {
    func getCarData(by id: Int, completion: @escaping (SelectedCarDTO?) -> Void)
}

final class SelectedCarServiceImpl: SelectedCarServiceProtocol {
    func getCarData(by id: Int, completion: @escaping (SelectedCarDTO?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            completion( self.CarNetworkStorage.first(where: {
                $0.id == id}))
        }
    }
    
    private let CarNetworkStorage = [
        SelectedCarDTO(id: 23, images: [.toyotaSedan, .toyotaFurgon, .toyotaUniversal], prices: [2225000, 3000000, 400000], bodyTypes: ["Седан", "Фургон", "Универсал"])
    ]
}
