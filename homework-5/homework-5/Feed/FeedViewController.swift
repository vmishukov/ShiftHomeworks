//
//  ViewController.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import UIKit

class FeedViewController: UIViewController {
    //MARK: - UI
    private lazy var feedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        view.addSubview(collectionView)
        return collectionView
    }()
    //MARK: - private variables
    private let collectionViewDataSource = FeedCollectionViewDataSource()
    private let collectionViewDelegate = FeedCollectionViewDelegate()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavbar()
        collectionViewDelegate.delegate = self
    }
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        feedCollectionView.collectionViewLayout.invalidateLayout()
    }
    //MARK: - setup ui
    private func setupUI() {
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        feedCollectionView.dataSource = collectionViewDataSource
        feedCollectionView.delegate = collectionViewDelegate
        view.backgroundColor = .systemBackground
    }
    //MARK: - setup navbar
    private func setupNavbar() {
        navigationItem.title = "Пивная энциклопедия"
    }
}

//MARK: - FeedViewControllerDelegate
extension FeedViewController: FeedViewControllerDelegate {
    func present(with data: FeedDetailedModel) {
        
        let dependencies = DetailedViewAssembly.Dependencies(navigationController: navigationController!, detailedModel: data)
        let vc = DetailedViewAssembly.makeModule(with: dependencies)
        navigationController?.pushViewController(vc, animated: true)
    }
}
