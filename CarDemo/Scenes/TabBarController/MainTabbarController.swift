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
//        let map = CarListBuilder.viewController()
        let story = UIStoryboard(name: "Main", bundle:nil)
        
        let map = story.instantiateViewController(withIdentifier: "CarListViewController") as! CarListViewController
        map.tabBarItem =  UITabBarItem.init(title: Constants.TabbarTitles.map , image: UIImage.init(named: "home_item"), tag: 0)
        let mapNavVC = CustomNavigationController.init(rootViewController: map)
        
        let carList = CarListBuilder.viewController()
        carList.tabBarItem =  UITabBarItem.init(title: Constants.TabbarTitles.list , image: UIImage.init(named: "home_item"), tag: 0)
        let listNavVC = CustomNavigationController.init(rootViewController: carList)
        let tabBarList = [mapNavVC, listNavVC]

        viewControllers = tabBarList
    }

}
