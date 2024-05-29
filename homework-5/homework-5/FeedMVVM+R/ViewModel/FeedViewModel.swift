//
//  FeedViewModel.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation

typealias Binding<T> = (T) -> Void

final class FeedViewModel {

    private let model: FeedModel
    private let router: FeedViewRouter
    
    private var feedNetworkData: [FeedNetworkModel]?
    var feedViewData: Binding<[FeedViewData]>?

    init(router: FeedViewRouter, model: FeedModel) {
        self.router = router
        self.model = model
    }

    func loadFeedData() {
        model.loadFeedData{ [weak self] feedData in
            guard let self = self else { return }
            self.feedNetworkData = feedData
            setFeedViewData()
        }
    }
    
    func viewDidLoad() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 2...10), repeats: true) { [weak self] _ in
            self?.loadFeedData()
        }
    }
    
    func didTapOnCell(with id: Int) {
        guard let feedNetworkData = feedNetworkData else {return}
        
        let feedDateiledViewData = FeedDetailedModel(
            title: feedNetworkData[id].title,
            image:  feedNetworkData[id].image,
            description: feedNetworkData[id].description,
            sourceLink: feedNetworkData[id].sourceLink)
        router.showDetailedViewScreen(data: feedDateiledViewData)
    }

    private func setFeedViewData() {
        guard let feedNetworkData = feedNetworkData else { return }
        feedViewData?(
            feedNetworkData.map{
                FeedViewData(title: $0.title, image: $0.image)
            }
        )
    }
}
