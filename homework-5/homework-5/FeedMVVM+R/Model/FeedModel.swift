//
//  FeedViewModel.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation

final class FeedModel {

    private let networkManager: NetworkClientProtocol

    init(networkManager: NetworkClientProtocol) {
        self.networkManager = networkManager
    }
    
    func loadFeedData(completion: @escaping ([FeedNetworkModel]) -> Void) {
        return networkManager.getFeed { [weak self] feed in
            
            completion(feed)
        }
    }
}
