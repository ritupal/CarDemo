//
//  MapViewController.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 29/07/22.
//

import UIKit
import MapKit

protocol MapDisplayLogic: AnyObject {
    func loadCarListOnMapView(viewModel: [MapViewModel])
    func showEmptyStateView()
}

class MapViewController: BaseViewController {
    var interactor: MapBuisnessLogic?
    @IBOutlet weak var mapView: MKMapView!
    
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
    
    //MARK:- Map Functions
    private func showCarListOnMap(list: [MapViewModel]) {
        DispatchQueue.main.async {
            
            for vehicle in list {
                let annotations = MKPointAnnotation()
                annotations.title = vehicle.carName
                annotations.coordinate = CLLocationCoordinate2D(latitude:vehicle.lattitude, longitude: vehicle.longitude)
                self.mapView.addAnnotation(annotations)
            }
            self.setMapCenter()
        }
        
    }
    
    private func setMapCenter() {
        if mapView.annotations.count  == 0 { return }
        var topLeft = CLLocationCoordinate2D(latitude:-90.0, longitude: 180.0)
        var bottomRight = CLLocationCoordinate2D(latitude:90.0, longitude: -180.0)
        for annotation in self.mapView.annotations {
            topLeft.longitude = fmin(topLeft.longitude, annotation.coordinate.longitude)
            topLeft.latitude = fmax(topLeft.latitude, annotation.coordinate.latitude)
            
            bottomRight.longitude = fmax(bottomRight.longitude, annotation.coordinate.longitude)
            bottomRight.latitude = fmin(bottomRight.latitude, annotation.coordinate.latitude)
        }
        
        var mapRegion = MKCoordinateRegion()
        mapRegion.center.latitude = topLeft.latitude - (topLeft.latitude - bottomRight.latitude) * 0.5
        mapRegion.center.longitude = topLeft.longitude + (bottomRight.longitude - topLeft.longitude) * 0.5
        
        mapRegion.span.latitudeDelta = fabs(topLeft.latitude - bottomRight.latitude) * 1.1
        mapRegion.span.longitudeDelta = fabs(bottomRight.longitude - topLeft.longitude) * 1.1
        
        mapRegion = self.mapView.regionThatFits(mapRegion)
        self.mapView.setRegion(mapRegion, animated: false)
    }
    
}

extension MapViewController: MapDisplayLogic {
    func loadCarListOnMapView(viewModel: [MapViewModel]) {
        hideSpinner()
        showCarListOnMap(list: viewModel)
    }
    
    func showEmptyStateView() {
        hideSpinner()
        print("show empty view")
    }
}
