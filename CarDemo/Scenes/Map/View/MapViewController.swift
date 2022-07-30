//
//  MapViewController.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import UIKit

protocol MapDisplayLogic: AnyObject {
    func loadCarListOnMapView(viewModel: [MapViewModel])
    func showEmptyStateView()
}

class MapViewController: BaseViewController {
    var interactor: MapBuisnessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getCarList()
    }
    
    // MARK:- Setup
    private func setup() {
      let viewController = self
      let interactor = MapInteractor()
      let presenter = MapPresenter()
      viewController.interactor = interactor
      interactor.presenter = presenter
      presenter.viewController = viewController
    }
    
    // MARK:- Functions
    private func getCarList() {
        showSpinner()
        interactor?.fetchCars()
    }
}

extension MapViewController: MapDisplayLogic {
    func loadCarListOnMapView(viewModel: [MapViewModel]) {
        hideSpinner()
        print("car name \(viewModel[0].carName)")
    }
    
    func showEmptyStateView() {
        hideSpinner()
        print("show empty view")
    }
}

