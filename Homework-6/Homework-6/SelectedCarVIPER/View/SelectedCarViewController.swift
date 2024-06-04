//
//  SelectedCarViewController.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 27.05.2024.
//

import Foundation
import UIKit

struct SelectedCarViewModel {
    let image: UIImage
}

protocol SelectedCarViewProtocol: AnyObject {
    func setModel(with model: SelectedCarViewModel)
    func setTable(with model: [SelectedCarBodyTypesDataSource])
    func setSelectedCell(with id: Int)
    func setPrice(amount: Int)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

final class SelectedCarViewController: UIViewController {
    
    private let contentView = SelectedCarView()
    private let presenter: SelectedCarPresenterProtocol
    private let loadingView = SpinnerViewController()
    
    init(presenter: SelectedCarPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelectedCarButton()
        contentView.carBodyTableViewDelegate.delegate = self
        presenter.viewDidLoad(ui: self)
    }
    
    private func setupNavbar() {
  
    }
    private func configureSelectedCarButton() {
        contentView.selectedCarButton.addTarget(self, action: #selector(configureSelectedCarButtonDidTapped), for: .touchUpInside)
    }
    @objc private func configureSelectedCarButtonDidTapped() {
        presenter.calculateButtonDidTapped()
    }
    @objc private func backButtonDidTapped() {
        presenter.calculateButtonDidTapped()
    }
}

extension SelectedCarViewController: SelectedCarViewProtocol {
    
    func showLoadingIndicator() {
        contentView.spinner.startAnimating()
        contentView.selectedCarButton.isEnabled = false
    }
    
    func hideLoadingIndicator() {
        contentView.spinner.stopAnimating()
        contentView.selectedCarButton.isEnabled = true
    }
    
    func setTable(with model: [SelectedCarBodyTypesDataSource]) {
        contentView.carBodyTableViewDataSource.selectedCarBodyTypes = model
        contentView.carBodyTableView.reloadData()
    }
    
    func setModel(with model: SelectedCarViewModel) {
        contentView.selectedСarImageView.image = model.image
    }
    
    func setPrice(amount: Int) {
        contentView.selectedCarPriceSumLabel.text = String(amount) + "$"
    }
    
    func setSelectedCell(with id: Int) {
        contentView.carBodyTableViewDataSource.checkedCellId = id
        contentView.carBodyTableView.reloadData()
    }
}

extension SelectedCarViewController: CarBodyTableViewCellDelegate {
    func didTapOnTableCell(with id: Int) {
        presenter.didTapOnTableCell(with: id)
    }
}
