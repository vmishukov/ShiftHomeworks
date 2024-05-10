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
    private enum cellSizeSetting: Int {
        case minimumInteritemSpacingForSectionAt = 8
        case cellsCountInRow = 2
        case height = 150
        case minimumLineSpacingForSectionAt = 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = FeedDetailedModel.createMockData()[indexPath.row]
        delegate?.present(with: data)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
   
    // задает размеры для каждой ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width - Double(cellSizeSetting.minimumInteritemSpacingForSectionAt.rawValue * cellSizeSetting.cellsCountInRow.rawValue)
        let cellWidth = availableWidth / CGFloat(cellSizeSetting.cellsCountInRow.rawValue)
        let CellHeight = Double(cellSizeSetting.height.rawValue)
        return CGSize(width: cellWidth, height: CellHeight)
    }
    // задает минимальнй отступ между строками коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cellSizeSetting.minimumLineSpacingForSectionAt.rawValue)
    }
    
    // минимальный отступ между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cellSizeSetting.minimumInteritemSpacingForSectionAt.rawValue)
    }
}
