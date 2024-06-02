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
}

final class SelectedCarViewController: UIViewController {

    private let contentView = SelectedCarView()
    private let presenter: SelectedCarPresenterProtocol
    
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
        presenter.viewDidLoad(ui: self)
    }
}

extension SelectedCarViewController: SelectedCarViewProtocol {
    func setTable(with model: [SelectedCarBodyTypesDataSource]) {
        contentView.carBodyTableViewDataSource.selectedCarBodyTypes = model
        contentView.carBodyTableView.reloadData()
    }
    
    func setModel(with model: SelectedCarViewModel) {
        contentView.selectedСarImageView.image = model.image
    }
    
}
