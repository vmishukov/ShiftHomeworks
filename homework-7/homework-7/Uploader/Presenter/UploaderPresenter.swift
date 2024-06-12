//
//  UploaderPresenter.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 09.06.2024.
//

import Foundation

final class UploaderPresenter {
    
    weak var view: UploaderViewProtocol?
    
    private let model: UploaderModel
    
    init(model: UploaderModel) {
        self.model = model
    }
    
    func viewDidLoad(view: UploaderViewProtocol) {
        self.view = view
    }
    
    func uploadButtonDidTapped(with urlString: String) {
        guard model.validateUrl(urlString: urlString) else {
            view?.showErrorAlert()
            return
        }
        
        Task {
            do {
                if let result = try await model.loadImage(with: urlString) {
                    await MainActor.run {
                        view?.addNewImage(image: result)
                    }
                }
            } catch {
                await MainActor.run {
                    self.view?.showErrorAlert()
                }
            }
        }
    }
}

