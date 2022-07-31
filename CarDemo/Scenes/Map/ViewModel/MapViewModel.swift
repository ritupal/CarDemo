//
//  MapViewModel.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

class MapViewModel {
    var carName: String
    var lattitude: Double
    var longitude: Double
    
    init(responseModel: CarResponseModel) {
        self.carName = responseModel.carFullName
        self.lattitude = responseModel.latitude ?? 0.0
        self.longitude = responseModel.longitude ?? 0.0
    }
}
