//
//  AboutMe.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 01.05.2024.
//

import Foundation
import UIKit

enum AboutMeView: String {
    case title = "Участник программы ШИФТ"
}

struct AboutMeModel {
    let avatar: UIImage
    let name: String
    let education: String
    let city: String
}
