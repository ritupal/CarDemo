//
//  CarListViewModel.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 30/07/22.
//

import Foundation

class CarListViewModel {
    var vehicleList: [TableCellConfigItemProtocol] = []
    
    init(list: [TableCellConfigItemProtocol]){
        self.vehicleList = list
    }
}
