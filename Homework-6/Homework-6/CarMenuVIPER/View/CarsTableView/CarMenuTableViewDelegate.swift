//
//  CarMenuCollectionViewDelegate.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

protocol CarMenuTableViewCellDelegate: AnyObject {
    func didTapOnTableCell()
}

final class CarMenuTableViewDelegate: NSObject, UITableViewDelegate {

    weak var delegate: CarMenuTableViewCellDelegate?
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarMenuTableViewHeader.identifier) as? CarMenuTableViewHeader else {
            return UIView()
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapOnTableCell()
    }
}
