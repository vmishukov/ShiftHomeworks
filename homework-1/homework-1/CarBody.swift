//
//  CarBody.swift
//  homework-1
//
//  Created by Vladislav Mishukov on 10.04.2024.
//

import Foundation

enum CarBody {
    case cityCar
    case hatchback
    case suv
    case convertible
    case peopleCarrier
    
    var typeNumber: Int {
        switch self {
        case .cityCar:
            return 1
        case .hatchback:
            return 2
        case .suv:
            return 3
        case .convertible:
            return 4
        case .peopleCarrier:
            return 5
        }
    }
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
