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
    private let dataSource = FeedCollectionViewDataSource()
    private let delegate = FeedCollectionViewDelegate()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavbar()
    }
    
    //MARK: - setup ui
    private func setupUI() {
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        feedCollectionView.dataSource = dataSource
        feedCollectionView.delegate = delegate
    }
    //MARK: - setup navbar
    private func setupNavbar() {
        navigationItem.title = "Пивная энциклопедия"
    }
}

