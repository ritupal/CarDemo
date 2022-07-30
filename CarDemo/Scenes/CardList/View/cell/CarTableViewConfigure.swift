//
//  CarTableViewConfigure.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import Foundation

import UIKit

internal final class CarTableViewConfigure: TableCellConfigProtocol {
    
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: CarListCell.reuseIdentifier, bundle: .main), forCellReuseIdentifier: CarListCell.reuseIdentifier)
        return tableView.dequeueReusableCell(withIdentifier: CarListCell.reuseIdentifier, for: indexPath)
    }
    
    func configureCell(_ cell: UITableViewCell, withItem item: Any) {
        guard let cell = cell as? CarListCell, let cellVM = item as? CarListCellViewModel else { return }
        cell.setData(cellVM)
    }
}
