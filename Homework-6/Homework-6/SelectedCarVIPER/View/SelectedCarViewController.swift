//
//  SelectedCarViewController.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 27.05.2024.
//

import Foundation
import UIKit

final class SelectedCarViewController: UIViewController {

    private let contentView = SelectedCarView()
  
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }
  
    private func setupNavbar() {
    }
}
