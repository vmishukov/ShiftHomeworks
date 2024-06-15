//
//  UploaderServicw.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 09.06.2024.
//

import Foundation
import UIKit

protocol UploaderServiceProtocol {
    func loadImage(with urlString: String) async throws -> Data?
    func validateURLFormat(urlString: String?) -> Bool
}

final class UploaderService: UploaderServiceProtocol {
    
    let asyncNetwork: AsyncNetworkClientProtocol
    
    init(asyncNetwork: AsyncNetworkClientProtocol) {
        self.asyncNetwork = asyncNetwork
    }
    
    func loadImage(with urlString: String) async throws -> Data? {
        if let request = makeRequest(with: urlString) {
            let data = try await asyncNetwork.fetch(from: request)
            return data
        }
        return nil
    }
    
    func validateURLFormat(urlString: String?) -> Bool {
        guard
            let urlString,
            let url = NSURL(string: urlString) else { return false }
        return UIApplication.shared.canOpenURL(url as URL)
    }
}

private extension UploaderService {
    
    func makeRequest(with urlString: String) -> URLRequest? {
        
        let baseComponent = URLComponents(string: urlString)
        guard let baseUrlComponent = baseComponent?.url else {
            return nil
        }
        return URLRequest(url: baseUrlComponent)
    }
}
