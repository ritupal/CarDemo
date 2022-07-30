//
//  CardListBuilder.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import UIKit

class CarListBuilder {
//TODO: Use of this class
    
    class func viewController() -> CarListViewController {
        let viewController = CarListViewController()
        let interactor = CarListInteractor()
        let presenter = CarListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
