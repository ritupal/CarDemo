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
