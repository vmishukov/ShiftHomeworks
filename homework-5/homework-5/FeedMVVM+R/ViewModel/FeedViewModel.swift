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
    //MARK: - init
    init(router: FeedViewRouter, model: FeedModel) {
        self.router = router
        self.model = model
    }
    //MARK: - public func
    func showDetailedViewScreen(with data: FeedDetailedModel) {
        router.showDetailedViewScreen(data: data)
    }
}

