//
//  FeedViewModel.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation

typealias Binding<T> = (T) -> Void

final class FeedViewModel {
    //MARK: - private
    private let model: FeedModel
    private let router: FeedViewRouter
    
    private var feedNetworkData: [FeedNetworkModel]?
    var feedViewData: Binding<[FeedViewData]>?
    //MARK: - init
    init(router: FeedViewRouter, model: FeedModel) {
        self.router = router
        self.model = model
    }
    //MARK: - public func
    func loadFeedData() {
        model.loadFeedData{ [weak self] feedData in
            guard let self = self else { return }
            self.feedNetworkData = feedData
            setFeedViewData()
        }
    }
    
    func showDetailedViewScreen(with id: Int) {
        guard let feedNetworkData = feedNetworkData else {return}
        
        let feedDateiledViewData = FeedDetailedModel(
            title: feedNetworkData[id].title,
            image:  feedNetworkData[id].image,
            description: feedNetworkData[id].description,
            sourceLink: feedNetworkData[id].sourceLink)
        router.showDetailedViewScreen(data: feedDateiledViewData)
    }
    //MARK: - private func
    private func setFeedViewData() {
        guard let feedNetworkData = feedNetworkData else { return }
        feedViewData?(
            feedNetworkData.map{
                FeedViewData(title: $0.title, image: $0.image)
            }
        )
    }
}
