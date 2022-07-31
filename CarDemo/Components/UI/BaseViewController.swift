//
//  BaseViewController.swift
//  CarDemo
//
//  Created by Kumari Ritu Pal on 28/07/22.
//

import Foundation
import UIKit
import  ProgressHUD

/// This is base view controller in which we write the common functions which we need in all controllers like show alert or show spinner
class BaseViewController: UIViewController, StoryboardHelper {
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.Styles.backGroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Progress hud functions
    func showSpinner() {
        ProgressHUD.show()
    }
    
    func hideSpinner() {
        ProgressHUD.dismiss()
    }
    
    
    
}
