//
//  CarBody.swift
//  homework-1
//
//  Created by Vladislav Mishukov on 10.04.2024.
//

import Foundation

enum CarBody: Int, CaseIterable {
    case cityCar = 1
    case hatchback = 2
    case suv = 3
    case convertible = 4
    case peopleCarrier = 5
    
    var title: String {
        switch self {
        case .cityCar:
            return "City Car"
        case .hatchback:
            return "Hatchback"
        case .suv:
            return "SUV"
        case .convertible:
            return "Convertible"
        case .peopleCarrier:
            return "People Carrier"
        }
    }
}
