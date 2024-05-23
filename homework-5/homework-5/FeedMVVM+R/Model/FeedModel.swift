//
//  FeedViewModel.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation

final class FeedModel {
    //MARK: - SERVICE
    private let networkManager: NetworkClientProtocol
    //MARK: - init
    init(networkManager: NetworkClientProtocol) {
        self.networkManager = networkManager
    }
    
    func loadFeedData(completion: @escaping ([FeedNetworkModel]) -> Void) {
        return networkManager.getFeed { [weak self] feed in
            guard let self = self else { return }
            completion(feed)
        }
    }
}
