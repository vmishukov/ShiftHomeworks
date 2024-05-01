//
//  ViewController.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 28.04.2024.
//

import UIKit

class AboutMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//MARK: - Storyboarded
extension AboutMeViewController: Storyboarded {
    static func containingStoryboard() -> Storyboard {
        return .Main
    }
}
