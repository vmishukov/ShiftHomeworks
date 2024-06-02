//
//  File.swift
//  Homework-6
//
//  Created by Vladislav Mishukov on 26.05.2024.
//

import Foundation
import UIKit

struct SelectedCarBodyTypesDataSource {
    let bodyType: String
}

final class CarBodyTableViewDataSource: NSObject, UITableViewDataSource {
    
    var selectedCarBodyTypes: [SelectedCarBodyTypesDataSource]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedCarBodyTypes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CarBodyTableViewCell.identifier,
            for: indexPath) as? CarBodyTableViewCell,
              let selectedCarBody = selectedCarBodyTypes?[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configure(bodyName: selectedCarBody.bodyType)
        return cell
    }
}
