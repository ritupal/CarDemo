//
//  DataManager.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import Foundation

//This Singleton class is used to pass the data from map controller to car list controller. By this there is no need to call the api again to show data on car list controller

class DataManager {
    static let shared = DataManager()
    var list:[CarResponseModel] = []
    private init() {}
    
    var allCars: [CarResponseModel] {
        get {
            return self.list
        }
        set {
            self.list = newValue
        }
    }
}
