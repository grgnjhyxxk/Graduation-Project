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
    
    func titleButton(text: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle("\(text)", for: .normal)
        button.backgroundColor = UIColor.appSubBackgroundColor
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        button.setTitleColor(UIColor.appTextColor, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .center
        
        return button
    }
}
