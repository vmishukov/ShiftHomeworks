//
//  ViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import UIKit

class FeedViewController: UIViewController {
 
    private let contentView = FeedView()

    let viewModel: FeedViewModel

    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func loadView() {
        super.loadView()
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        contentView.collectionViewDelegate.viewControllerDelegate = self
        bind()
        viewModel.timerUpdate()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        contentView.feedCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setupNavbar() {
        navigationItem.title = "Пивная энциклопедия"
    }

    private func bind() {
        viewModel.feedViewData = { [weak self] feedData in
            self?.contentView.collectionViewDataSource.feedData = feedData
            self?.contentView.feedCollectionView.reloadData()
        }
    }
}

extension FeedViewController: FeedViewControllerDelegate {
    func present(id: Int) {
        viewModel.showDetailedViewScreen(with: id)
    }
}
