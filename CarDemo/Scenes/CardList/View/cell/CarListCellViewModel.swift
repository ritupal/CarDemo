//
//  CarListCellViewModel.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import UIKit

internal final class CarListCellViewModel {
    var name: String?
    var licencePlate: String?
    var fuelType: String?
    var carImage: String?
    
    init(responseModel: CarResponseModel) {
        self.name = responseModel.carFullName
        self.licencePlate = responseModel.licensePlate
        self.fuelType = responseModel.fuelType?.fullName
        self.carImage = responseModel.carImageUrl
    }
}

extension CarListCellViewModel: TableCellConfigItemProtocol {
    var cellConfigure: TableCellConfigProtocol {
        return CarTableViewConfigure()
    }
}
