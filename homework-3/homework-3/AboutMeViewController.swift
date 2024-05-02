//
//  ViewController.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 28.04.2024.
//

import UIKit

class AboutMeViewController: UIViewController {
    //MARK: - model
    private let model = AboutMeModel(
        avatar: .snowPrincess,
        name: "•Мишуков Владислав Иванович, 23 года",
        education: "•Выпускник Яндекс Практикума. Окончил ВКИ НГУ",
        city: "•Живу рядом с Новосибирском")
    
    //MARK: - outlet
    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var titleLabelView: UILabel!
    
    @IBOutlet weak var nameLabelView: UILabel!
    
    @IBOutlet weak var educationLabelView: UILabel!
    
    @IBOutlet weak var cityLabelView: UILabel!
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
    }
    //MARK: - setup model
    private func setupModel() {
        titleLabelView.text = AboutMeView.title.rawValue
        titleImageView.image = model.avatar
        nameLabelView.text = model.name
        educationLabelView.text = model.education
        cityLabelView.text = model.city
    }

}

//MARK: - Storyboarded
extension AboutMeViewController: Storyboarded {
    static func containingStoryboard() -> Storyboard {
        return .Main
    }
}
