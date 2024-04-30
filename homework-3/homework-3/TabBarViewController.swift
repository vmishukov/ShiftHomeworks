//
//  TabBarViewController.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 29.04.2024.
//

import Foundation
import UIKit

final class TabBarViewController: UITabBarController {
    
    //MARK: - lyfecycle
    override func awakeFromNib() {
        super.awakeFromNib()

        self.viewControllers = [createAboutMeController(), createSkillsViewController()]
    }
    
    //MARK: - tab bar controllers
    func createAboutMeController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutMeViewController")
        vc.tabBarItem = UITabBarItem(
            title: "Обо мне",
            image: UIImage(systemName: "person.circle"),
            tag: 1
        )
        return vc
    }
    
    func createSkillsViewController() -> UIViewController {
        let vc = SkillsViewController()
        vc.tabBarItem = UITabBarItem(
            title: "Навыки разработчика",
            image: UIImage(systemName: "laptopcomputer"),
            tag: 2)
        return vc
    }
    
    //MARK: - UI
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
