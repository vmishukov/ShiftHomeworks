//
//  SelectedCarModel.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 01.06.2024.
//

import Foundation
import UIKit
struct SelectedCarModel {
    
    let carModelId: Int
    let modelTypes: [SelectedCarModelTypes]
}

struct SelectedCarModelTypes {
    
    let bodyType: String
    let image: UIImage
    let price: Int
}
