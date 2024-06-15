//
//  CompaniesTableViewDataSource.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 15.06.2024.
//

import Foundation
import UIKit

final class CompaniesTableViewDataSource: NSObject, UITableViewDataSource {
    
    var companyData: [CompanyModel]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        companyData?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CompaniesTableViewCell.identifier, for: indexPath) as? CompaniesTableViewCell {
            if let company = companyData?[indexPath.row] {
                cell.setupContent(with: company)
            }
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
           // presenter.deleteTaped(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
}
