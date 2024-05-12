//
//  FeedCollectionViewDelegate.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import Foundation
import UIKit

protocol FeedViewControllerDelegate: AnyObject {
    func present(with data: FeedDetailedModel)
}

final class FeedCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    //MARK: - FeedViewControllerDelegate
    weak var delegate: FeedViewControllerDelegate?
    //MARK: - cellSizeSetting
    static let minimumInteritemSpacingForSectionAt = 8
    static let cellsCountInRow = 8
    static let height = 8
    static let minimumLineSpacingForSectionAt = 10
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = FeedDetailedModel.createMockData()[indexPath.row]
        delegate?.present(with: data)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
   
    // задает размеры для каждой ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - Double(FeedCollectionViewDelegate.minimumInteritemSpacingForSectionAt * FeedCollectionViewDelegate.cellsCountInRow)
        let cellWidth = availableWidth / CGFloat(FeedCollectionViewDelegate.cellsCountInRow)
        let CellHeight = Double(FeedCollectionViewDelegate.height)
        return CGSize(width: cellWidth, height: CellHeight)
    }
    // задает минимальнй отступ между строками коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(FeedCollectionViewDelegate.minimumLineSpacingForSectionAt)
    }
    
    // минимальный отступ между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(FeedCollectionViewDelegate.minimumInteritemSpacingForSectionAt)
    }
}
