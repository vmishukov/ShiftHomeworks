//
//  FeedCollectionViewDataSource.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import Foundation
import UIKit

final class FeedCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let mockData = FeedDetailedModel.createMockData()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
        cell.setupData(with: mockData[indexPath.row].collectionModel)
        return cell
    }
}
