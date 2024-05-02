//
//  Skills.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 01.05.2024.
//

import Foundation

enum SkillsView: String {
    case skillsTitle = "Как давно занимаетесь программированием? Какие языки изучали?"
    case skillsExpecTitle = "Чего ждете от обучения?"
}

struct skillsModel {
    let skillsBody: String
    let expecBody: String
}
