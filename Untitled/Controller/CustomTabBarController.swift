//
//  CustomTabBarController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/31.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    let addViewControllerNavigationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    func configureLayout() {
        self.tabBar.tintColor = UIColor.black.withAlphaComponent(0.6)
        self.tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.5)
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        
        let firstViewController = homeViewController()
        let secondViewController = alarmViewController()
        let thirdViewController = aiRecommendedViewController()
        
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        firstViewController.tabBarItem.image = UIImage(systemName: "house")
        
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "shippingbox.fill")
        secondViewController.tabBarItem.image = UIImage(systemName: "shippingbox")
        
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "arrow.2.squarepath")
        thirdViewController.tabBarItem.image = UIImage(systemName: "arrow.2.squarepath")
        
        viewControllers = [firstViewController, secondViewController, thirdViewController]
    }
}


