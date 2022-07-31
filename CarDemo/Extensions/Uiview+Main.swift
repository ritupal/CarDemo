//
//  Uiview+Main.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import UIKit

// This is used to give the default features to the uiview like corner radius, border, border width, border color, shadow etc
@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return layer.cornerRadius}
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue>0
        }
    }
}
