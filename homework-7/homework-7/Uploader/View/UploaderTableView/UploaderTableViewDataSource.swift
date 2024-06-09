//
//  UploaderTableViewDataSource.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 04.06.2024.
//

import Foundation
import UIKit

final class UploaderTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
