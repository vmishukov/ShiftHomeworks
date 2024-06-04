//
//  ViewController.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import UIKit

protocol CarMenuViewProtocol: AnyObject {
    func set(with: [CarModel]?)
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
        presenter.viewDidLoad(ui: self)
        setupNavbar()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setupNavbar() {
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = ProjectFonts.carTitle
            label.text = "Выберите"
            return label
        }()
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.tintColor = ProjectColors.green
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
       
    }
}

extension CarMenuViewController: CarMenuTableViewCellDelegate {
    func didTapOnTableCell(with id: Int) {
        presenter.didTapOnTableCell(with: id)
    }
}

extension CarMenuViewController: CarMenuViewProtocol {
    func set(with carList: [CarModel]?) {
        contentView.carMenuTableViewDataSource.set(with: carList)
        contentView.carMenuTableView.reloadData()
    }
}


