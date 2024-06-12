//
//  UploaderTableViewDataSource.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import Foundation
import UIKit

final class UploaderTableViewDataSourceDelegate: NSObject, UITableViewDataSource {
    
    var images: [UIImage] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UploaderTableViewCell.identifier, for: indexPath) as? UploaderTableViewCell else { return UITableViewCell()}
        let image = images[indexPath.row]
        cell.configCell(with: image)
        return cell
    }
}

extension UploaderTableViewDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.row]
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
}
