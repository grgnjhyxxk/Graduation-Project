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
        self.tabBar.tintColor = UIColor.black.withAlphaComponent(0.8)
        self.tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.65)
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        
        let firstViewController = homeViewController()
        let secondViewController = alarmViewController()
        let thirdViewController = aiRecommendedViewController()
        
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        firstViewController.tabBarItem.image = UIImage(systemName: "house")
        
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "alarm.fill")
        secondViewController.tabBarItem.image = UIImage(systemName: "alarm")
        
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "staroflife.fill")
        thirdViewController.tabBarItem.image = UIImage(systemName: "staroflife.fill")
        
        viewControllers = [firstViewController, secondViewController, thirdViewController]
    }
}


