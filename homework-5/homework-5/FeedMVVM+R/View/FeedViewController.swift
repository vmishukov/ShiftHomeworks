//
//  ViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import UIKit

class FeedViewController: UIViewController {
    //MARK: - UI
    private let contentView = FeedView()
    //MARK: - view model
    let viewModel: FeedViewModel
    //MARK: - init
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - lifecycle
    override func loadView() {
        super.loadView()
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        contentView.collectionViewDelegate.viewControllerDelegate = self
        bind()
        viewModel.loadFeedData()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        contentView.feedCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    //MARK: - setup navbar
    private func setupNavbar() {
        navigationItem.title = "Пивная энциклопедия"
    }
    //MARK: - BIND
    private func bind() {
        viewModel.feedViewData = { [weak self] feedData in
            self?.contentView.collectionViewDataSource.feedData = feedData
            self?.contentView.feedCollectionView.reloadData()
        }
    }
}

//MARK: - FeedViewControllerDelegate
extension FeedViewController: FeedViewControllerDelegate {
    func present(with data: FeedDetailedModel) {
        viewModel.showDetailedViewScreen(with: data)
    }
}
