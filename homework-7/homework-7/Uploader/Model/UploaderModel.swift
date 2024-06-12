//
//  UploaderModel.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 09.06.2024.
//

import Foundation
import UIKit

final class UploaderModel {
    
    private let service: UploaderServiceProtocol
    
    init(service: UploaderServiceProtocol) {
        self.service = service
    }
    
    enum modelErrors: Error {
        case notAnImageData
    }
    
    func loadImage(with urlString: String) async throws -> UIImage? {
        
        do {
            guard
                let imageData = try await service.loadImage(with: urlString),
                let image = UIImage(data: imageData)
            else { throw modelErrors.notAnImageData }
            return image
        } catch let error{
            throw error
        }
    }
    
    func validateUrl(urlString: String) -> Bool {
        service.validateURLFormat(urlString: urlString)
    }
}

private extension UploaderModel {
    
}
