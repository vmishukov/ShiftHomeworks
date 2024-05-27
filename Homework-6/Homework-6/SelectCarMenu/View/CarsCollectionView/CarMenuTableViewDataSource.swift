//
//  File.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

final class CarMenuTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CarMenuTableViewCell.identifier,
            for: indexPath) as? CarMenuTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
}
