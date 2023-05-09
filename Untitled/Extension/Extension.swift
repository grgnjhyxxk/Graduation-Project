//
//  UIViewController+Extension.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

extension UIView {
    func shadowLayer() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.05
        layer.shadowOffset = CGSize(width: 0.5, height: 3)
        layer.shadowRadius = 5
    }
}

extension UIColor {
    static let alarmViewUserImageBaseColor = UIColor(named: "AlarmViewUserImageBaseColor")
    static let resigterLabelColor = UIColor(named: "ResigterLabelColor")
    static let passwordVisibilityButtonColor = UIColor(named: "PasswordVisibilityButtonColor")
    static let appSubBackgroundColor = UIColor(named: "AppSubBackgroundColor")
    static let appPointColor = UIColor(named: "AppPointColor")
    static let appMainBackgroundColor = UIColor(named: "AppMainBackgroundColor")
    static let appTextColor = UIColor(named: "AppTextColor")
    static let loginButtonTextColor = UIColor(named: "LoginButtonTextColor")
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
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor.appPointColor
        layer.cornerRadius = 22
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0.5, height: 3)
        layer.shadowRadius = 5
    }
}

extension UILabel {
    func labelTextCommonStyle() {
        self.textColor = UIColor.appTextColor
//        layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2)
//        layer.shadowRadius = 4
//        layer.shadowOpacity = 1
        layer.masksToBounds = false
        self.numberOfLines = 0
    }
}
