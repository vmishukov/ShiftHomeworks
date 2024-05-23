//
//  FeedCollectionViewDelegate.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 05.05.2024.
//

import Foundation
import UIKit

protocol FeedViewControllerDelegate: AnyObject {
    func present(id: Int)
}

final class FeedCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    //MARK: - FeedViewControllerDelegate
    weak var viewControllerDelegate: FeedViewControllerDelegate?
    //MARK: - cellSizeSetting
    enum cellSizeSetting {
        static let minimumInteritemSpacingForSectionAt = 8
        static let cellsCountInRow = 2
        static let height = 200
        static let minimumLineSpacingForSectionAt = 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewControllerDelegate?.present(id: indexPath.row)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
   
    // задает размеры для каждой ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - Double(cellSizeSetting.minimumInteritemSpacingForSectionAt * cellSizeSetting.cellsCountInRow)
        let cellWidth = availableWidth / CGFloat(cellSizeSetting.cellsCountInRow)
        let CellHeight = Double(cellSizeSetting.height)
        return CGSize(width: cellWidth, height: CellHeight)
    }
    // задает минимальнй отступ между строками коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cellSizeSetting.minimumLineSpacingForSectionAt)
    }
    
    // минимальный отступ между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cellSizeSetting.minimumInteritemSpacingForSectionAt)
    }
}
