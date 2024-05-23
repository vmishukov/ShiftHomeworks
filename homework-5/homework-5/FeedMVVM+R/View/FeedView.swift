//
//  FeedView.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 22.05.2024.
//

import Foundation
import UIKit

final class FeedView: UIView {
    //MARK: - UI
    lazy var feedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        addSubview(collectionView)
        return collectionView
    }()
    //MARK: - collectionView delegates
    let collectionViewDataSource = FeedCollectionViewDataSource()
    let collectionViewDelegate = FeedCollectionViewDelegate()
    
    //MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setup ui
    private func setupUI() {
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
        feedCollectionView.dataSource = collectionViewDataSource
        feedCollectionView.delegate = collectionViewDelegate
        backgroundColor = .systemBackground
    }
}
