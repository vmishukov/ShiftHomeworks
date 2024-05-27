//
//  ViewController.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import UIKit

class CarMenuViewController: UIViewController {
    //MARK: - UI
    let contentView = CarMenuView()
    //MARK: - lifecycle
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.centerTitle()
    }
    //MARK: - setupNavbar
    private func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
      //  navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Выберите"
    }
}

extension UIViewController{
    func centerTitle(){
        for navItem in(self.navigationController?.navigationBar.subviews)! {
             for itemSubView in navItem.subviews {
                 if let largeLabel = itemSubView as? UILabel {
                    largeLabel.center = CGPoint(x: navItem.bounds.width/2, y: navItem.bounds.height/2)
                    return;
                 }
             }
        }
    }
}
