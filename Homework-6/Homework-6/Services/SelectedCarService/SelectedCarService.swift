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
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion( self.CarNetworkStorage.first(where: {
                $0.id == id}))
        }
    }
    
    private let CarNetworkStorage = [
        SelectedCarDTO(id: 23, images: [.Toyota.toyotaSedan, .Toyota.toyotaFurgon, .Toyota.toyotaUniversal, .Toyota.toyotaLandCruiser], prices: [2225000, 3000000, 400000, 500000] , bodyTypes: ["Седан", "Фургон", "Универсал", "Внедорожник"]),
        
        SelectedCarDTO(id: 41, images: [.Nissan.nissanSedan, .Nissan.nissanFurg, .Nissan.nissanUni, .Nissan.nissanOffroad, .Nissan.skyline], prices: [3225000, 403454353, 504300, 600343, 999999999] , bodyTypes: ["Седан", "Фургон", "Универсал", "Внедорожник", "Легенда"]),
        
        SelectedCarDTO(id: 3, images: [.Kia.sedan, .Kia.furgon, .Kia.universal, .Kia.offroad], prices: [5225000, 60454353, 704300, 904343] , bodyTypes: ["Седан", "Фургон", "Универсал", "Внедорожник"]),
        
        SelectedCarDTO(id: 32, images: [.Volkswagen.sedan, .Volkswagen.furgon, .Volkswagen.universal, .Volkswagen.offroad], prices: [3323232, 43434343, 121212212, 34455464] , bodyTypes: ["Седан", "Фургон", "Универсал", "Внедорожник"]),
        
        SelectedCarDTO(id: 232, images: [.BMW.sedan, .BMW.furgon, .Volkswagen.universal, .BMW.offroad, .BMW.legend], prices: [43543543, 657657, 12321321, 54544, 9999999] , bodyTypes: ["Седан", "Фургон", "Универсал", "Внедорожник", "Легенда"])
    ]
}
