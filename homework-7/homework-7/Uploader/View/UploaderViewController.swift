//
//  ViewController.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import UIKit

protocol UploaderViewProtocol {
    
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
        // Do any additional setup after loading the view.
    }
}

extension UploaderViewController: UploaderViewProtocol {
    
}
