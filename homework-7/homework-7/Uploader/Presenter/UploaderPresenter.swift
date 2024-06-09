//
//  UploaderPresenter.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 09.06.2024.
//

import Foundation

final class UploaderPresenter {
    
    weak var view: UploaderView?
    
    private let model: UploaderModel
    
    init(model: UploaderModel) {
        self.model = model
    }
    
    func viewDidLoad(view: UploaderView) {
        self.view = view
    }
}
