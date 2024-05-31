//
//  CarMenuCollectionViewDelegate.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

protocol CarBodyTableViewCellDelegate: AnyObject {
    func didTapOnTableCell()
}

final class CarBodyTableViewDelegate: NSObject, UITableViewDelegate {

    weak var delegate: CarBodyTableViewCellDelegate?
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarBodyTableViewHeader.identifier) as? CarBodyTableViewHeader else {
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
