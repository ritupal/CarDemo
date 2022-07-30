//
//  CarListPresenter.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol CarListPresentationLogic {
    func onCarListFetchSucceed(list: [CarResponseModel])
    func onCarListFetchFailed()
}

class CarListPresenter {
  weak var viewController: CarListDisplayLogic?
}

extension CarListPresenter: CarListPresentationLogic {
    func onCarListFetchSucceed(list: [CarResponseModel]) {
        // parse response models to collection of cell view models which woll be displayes on table view
        var listCells = [TableCellConfigItemProtocol]()
        
        if !list.isEmpty {
            listCells = list.map({CarListCellViewModel(responseModel: $0)})
        }
        
        let viewModel = CarListViewModel(list: listCells)
        viewController?.loadVehicleList(viewModel: viewModel)
    }
    
    func onCarListFetchFailed() {
        viewController?.showEmptyView()
    }
}
