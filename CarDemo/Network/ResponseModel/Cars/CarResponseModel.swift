//
//  CarResponseModel.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

enum FuelType: String, Codable {
    case petrol = "P"
    case diesel = "D"
    case electric = "E"
    
    var fullName: String {
        switch self {
        case .petrol:
            return Constants.FuelNames.diesel
        case .diesel:
            return Constants.FuelNames.petrol
        case .electric:
            return Constants.FuelNames.electric
        }
    }
}

// MARK: - Result
struct CarResponseModel: Codable {
    let id: String?
    let name, make, licensePlate: String?
    let fuelType: FuelType?
    let carImageUrl: String?
    let latitude, longitude: Double?
    
    var carFullName: String {
        return "\(name ?? "") \(make ?? "")"
    }
}
