//
//  CardListBuilder.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import UIKit

class CarListBuilder {

    class func viewController() -> CarListViewController {
        let viewController = CarListViewController()
        let interactor = CarListInteractor()
        let presenter = CarListPresenter()
        let router = CarListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
