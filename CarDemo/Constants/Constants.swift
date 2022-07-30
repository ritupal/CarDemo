//
//  Constants.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import Foundation
import UIKit

struct Constants {
    
    struct TabbarTitles {
        static let map = "tabbar_item_map".localized()
        static let list = "tabbar_item_list".localized()
    }
    
    struct Dashboard {
        static let title = "dashboard_title".localized()
    }
    
    struct Styles {
        static let mainColor: UIColor = #colorLiteral(red: 0.9294117647, green: 0.431372549, blue: 0.262745098, alpha: 1)
        static let titleColor: UIColor = .white
        static let tabbarUnselectColor: UIColor = .white
        static let backGroundColor: UIColor = .black
        static let tabbarStyleColor: UIBarStyle = .black
    }
    
    struct ImageNames {
        static let carPlaceholder = "car_placeholder"
    }
    
    // API Headers
    struct APIHeaders {
        static var kContentType = "Content-Type"
        static var contentTypeValue = "application/json"
    }
    
    // Fuel Names
    struct FuelNames {
        static var diesel = "diesel".localized()
        static var petrol = "petrol".localized()
        static var electric = "electric".localized()
    }
}
