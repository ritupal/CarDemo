//
//  MapInteractor.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

protocol MapBuisnessLogic {
    func fetchCars()
}
protocol MapDataStore
{
    var carList: [CarResponseModel] { get }
}

class MapInteractor: MapDataStore {
    
    var carList: [CarResponseModel] = []
    var presenter: MapPresentationLogic?
    var carService: CarServiceProtocol
    
    init(carService: CarServiceProtocol = CarService()){
        self.carService = carService
    }
}


extension MapInteractor: MapBuisnessLogic {
    
    func fetchCars() {
        carService.getCarList(param: [:]) {response, error in
            guard let list = response else {
                self.carList.removeAll()
                self.presenter?.onGetCarListForMapFailed()
                return
            }
            self.carList = list
            DataManager.shared.allCars = list
            self.isDataEmpty() ? self.presenter?.onGetCarListForMapFailed(): self.presenter?.onGetCarListForMapSucceed(list: list)
        }
    }
    
    private func isDataEmpty() -> Bool {
        self.carList.isEmpty
    }
    
}
