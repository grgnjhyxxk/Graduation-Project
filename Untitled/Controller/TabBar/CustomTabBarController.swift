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
        print("커스텀 탭바가 로드되었습니다.")
        configureLayout()
    }
    
    func configureLayout() {
        self.tabBar.tintColor = UIColor.appPointColor
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.backgroundColor = UIColor.appMainBackgroundColor
        let firstViewController = VitaminViewController()
        let secondViewController = AlarmViewController()
        let thirdViewController = AiRecommendedViewController()
        
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        firstViewController.tabBarItem.image = UIImage(systemName: "house")
        
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "alarm.fill")
        secondViewController.tabBarItem.image = UIImage(systemName: "alarm")
        
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "staroflife.fill")
        thirdViewController.tabBarItem.image = UIImage(systemName: "staroflife.fill")
        
        viewControllers = [firstViewController, secondViewController, thirdViewController]
//        viewControllers = [secondViewController, thirdViewController]
    }
}


