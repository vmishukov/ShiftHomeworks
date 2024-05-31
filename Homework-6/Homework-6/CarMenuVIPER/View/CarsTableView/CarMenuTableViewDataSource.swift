//
//  File.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

final class CarMenuTableViewDataSource: NSObject, UITableViewDataSource {
    
    private var carList: [CarModel]?
    
    func set(with carList: [CarModel]?) {
        self.carList = carList
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CarMenuTableViewCell.identifier,
            for: indexPath) as? CarMenuTableViewCell
        else {
            return UITableViewCell()
        }
        
        guard let carModelName = carList?[indexPath.row].carModel else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: carModelName)
        return cell
    }
}
