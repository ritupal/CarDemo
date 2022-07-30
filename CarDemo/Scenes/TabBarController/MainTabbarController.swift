//
//  MainTabbarController.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        self.setTabBarVC()
    }
    
    //MARK:- Setup functions
    private func setupTabBar() {
        self.tabBar.barStyle = Constants.Styles.tabbarStyleColor
        self.tabBar.tintColor = Constants.Styles.mainColor
        self.tabBar.unselectedItemTintColor = Constants.Styles.tabbarUnselectColor
        self.tabBar.isTranslucent = false
    }
    
    private func setTabBarVC() {
        let mapVC: MapViewController = MapViewController.instantiate(MapViewController.self)
        mapVC.tabBarItem =  UITabBarItem.init(title: Constants.TabbarTitles.map , image: UIImage(systemName: "map"), tag: 0)
        let mapNavVC = CustomNavigationController.init(rootViewController: mapVC)
        mapNavVC.setNavBarTitle(title: Constants.TabbarTitles.map)
        
        let carListVC: CarListViewController = CarListViewController.instantiate(CarListViewController.self)
        carListVC.tabBarItem =  UITabBarItem.init(title: Constants.TabbarTitles.list , image: UIImage(systemName: "list.bullet"), tag: 0)
        let listNavVC = CustomNavigationController.init(rootViewController: carListVC)
        listNavVC.setNavBarTitle(title: Constants.TabbarTitles.list)
        
        let tabBarList = [mapNavVC, listNavVC]

        viewControllers = tabBarList
    }

}
