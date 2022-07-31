//
//  EmptyStateEnum.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import UIKit

/// This enum is used to empty view'd description and image where is no data on the screen.
enum EmptyState {
    case map
    case list
    
    var description: String{
        switch self{
        case .map:
            return Constants.EmptyState.descriptions.map
        case .list:
            return Constants.EmptyState.descriptions.list
        }
    }
    
    var emptyImage: UIImage? {
        switch self{
        case .map:
            return Constants.EmptyState.images.map
        case .list:
            return Constants.EmptyState.images.list
        }
    }
}
