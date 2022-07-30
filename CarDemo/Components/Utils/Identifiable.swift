//
//  Identifiable.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import UIKit

protocol Identifiable {
    static var reuseIdentifier: String {get}
}

extension Identifiable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

internal protocol TableCellConfigProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func configureCell(_ cell: UITableViewCell, withItem item: Any)
}

internal protocol TableCellConfigItemProtocol {
    var cellConfigure: TableCellConfigProtocol { get }
}
