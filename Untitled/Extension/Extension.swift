//
//  UIViewController+Extension.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

extension UIViewController {
    func setSameBackgroundColor(firstAlpha: CGFloat, secondAlpha: CGFloat) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 38/255, green: 151/255, blue: 255/255, alpha: firstAlpha).cgColor, UIColor(red: 171/255, green: 79/255, blue: 13/255, alpha: secondAlpha).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    static let baseViewBackgroundColor = UIColor(named: "BaseViewBackgroundColor")
    static let layerViewBackgroundColor = UIColor(named: "LayerViewBackgroundColor")
    
    static let customTabBarControllerItemTintColor = UIColor(named: "CustomTabBarControllerItemTintColor")
    
    static let alarmViewUserImageBaseColor = UIColor(named: "AlarmViewUserImageBaseColor")
    
    static let resigterLabelColor = UIColor(named: "ResigterLabelColor")
    static let passwordVisibilityButtonColor = UIColor(named: "PasswordVisibilityButtonColor")
    static let loginButtonColor = UIColor(named: "LoginButtonColor")
}

extension UIButton {
    func appButtonCommonStyle() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0.5, height: 3)
        layer.shadowRadius = 5
        layer.masksToBounds = false
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 133/255, green: 185/255, blue: 255/255, alpha: 0.45).cgColor
    }
    
    func titleButtonCommonStyle() {
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.backgroundColor = UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07)
        layer.cornerRadius = 22
    }
}

extension UILabel {
    func labelTextCommonStyle() {
        self.textColor = UIColor.white
        layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.masksToBounds = false
        self.numberOfLines = 0
    }
}
