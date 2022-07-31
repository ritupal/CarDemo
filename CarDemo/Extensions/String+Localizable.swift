//
//  String+Localizable.swift
//  Car Demo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import Foundation

// This extension is used to get the localized string and "localized" function is used for it
extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
