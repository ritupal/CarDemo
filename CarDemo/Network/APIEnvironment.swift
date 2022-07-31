//
//  APIEnvironment.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

enum APIEnvironment {
    case development
    case stanging
    case production
    
    func baseUrl() -> String {
        return "https://\(domain)/\(subDomain)"
    }
    
    var domain: String {
        switch self {
        case .development:
            return "cdn.sixt.io"
        case .stanging, .production:
            return "cdn.sixt.io"
        }
    }
    
    var subDomain: String {
        switch self {
        case .development, .stanging, .production:
            return "codingtask"
        }
    }
    
}
