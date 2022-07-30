//
//  Uiview+Main.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return layer.cornerRadius}
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue>0
        }
    }
}
