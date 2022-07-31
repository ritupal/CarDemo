//
//  CustomNavigationController.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import UIKit

/// This is custom navigation controller in which all the controllers stacks up
class CustomNavigationController: UINavigationController {
    override func viewDidLoad() {
        setupStyle()
    }
    
    private func setupStyle() {
        self.navigationBar.barStyle = Constants.Styles.tabbarStyleColor
        self.navigationBar.isTranslucent = false
        self.navigationBar.isHidden = false
        self.navigationBar.tintColor = Constants.Styles.mainColor
        let textAttributes = [NSAttributedString.Key.foregroundColor:Constants.Styles.mainColor]
        self.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setNavBarTitle(title: String) {
        self.navigationBar.topItem?.title = title
    }

}
