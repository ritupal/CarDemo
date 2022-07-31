//
//  MapPresenter.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import Foundation

/// This protocol gets data from interactor and conver them in view model and pass it the view controller.
protocol MapPresentationLogic {
    func onGetCarListForMapSucceed(list: [CarResponseModel])
    func onGetCarListForMapFailed()
}

class MapPresenter {
  weak var viewController: MapDisplayLogic?
  
}

//MARK: -Presentation logic implementation
extension MapPresenter: MapPresentationLogic {
    
    func onGetCarListForMapSucceed(list: [CarResponseModel]) {
        if !list.isEmpty {
            let mapVM = list.map({MapViewModel.init(responseModel: $0)})
            viewController?.loadCarListOnMapView(viewModel: mapVM)
        }
    }
    
    func onGetCarListForMapFailed() {
        viewController?.showEmptyStateView()
    }
    
    
}
