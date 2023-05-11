//
//  MainView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class HomeView: UIView {
    func AppIconImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "AppIcon")
        imageView.backgroundColor = UIColor.appSubBackgroundColor
        imageView.layer.cornerRadius = 13
        imageView.clipsToBounds = true
        
        return imageView
    }
}
