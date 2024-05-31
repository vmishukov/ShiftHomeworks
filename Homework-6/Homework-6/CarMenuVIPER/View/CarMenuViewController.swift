//
//  ViewController.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import UIKit

protocol CarMenuViewProtocol: AnyObject {
    
}

class CarMenuViewController: UIViewController {

    let contentView = CarMenuView()
    let presenter: CarMenuPresenterProtocol
    
    init(presenter: CarMenuPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.carMenuTableViewDelegate.delegate = self
        setupNavbar()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setupNavbar() {
        navigationItem.title = "Выберите"
    }
}

extension CarMenuViewController: CarMenuTableViewCellDelegate {
    func didTapOnTableCell() {
        let vc = SelectedCarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CarMenuViewController: CarMenuViewProtocol {
    
}


