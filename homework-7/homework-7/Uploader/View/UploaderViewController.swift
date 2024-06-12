//
//  ViewController.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import UIKit

protocol UploaderViewProtocol: AnyObject {
    func showErrorAlert()
    func addNewImage(image: UIImage)
}

class UploaderViewController: UIViewController {
    
    private let contentView = UploaderView()
    private let presenter: UploaderPresenter
    
    init(presenter: UploaderPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setUpUI()
        // Do any additional setup after loading the view.
    }
}

private extension UploaderViewController {
    func setUpUI() {
        contentView.uploaderButton.addTarget(self, action: #selector(uploaderButtonDidTapped), for: .touchUpInside)
    }
    
    @objc func uploaderButtonDidTapped() {
        if let urlString = contentView.uploaderTextField.text {
            presenter.uploadButtonDidTapped(with: urlString)
        }
    }
}

extension UploaderViewController: UploaderViewProtocol {
    
    func addNewImage(image: UIImage) {
        contentView.uploaderTableViewDataSourceDelegate.images.append(image)
        contentView.uoloaderTableView.reloadData()
    }
    
    func showErrorAlert() {
        
        let wrongURL = UIAlertController(
            title: "Ошибка",
            message: "Неправильно введенная ссылка",
            preferredStyle: .alert
        )
        wrongURL.addAction(
            UIAlertAction(
                title: "Ок",
                style: .cancel
            ) { _ in
                wrongURL.dismiss(animated: true)
            }
        )
        self.present(wrongURL, animated: true)
    }
}
