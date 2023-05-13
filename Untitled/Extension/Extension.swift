//
//  UIViewController+Extension.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIView {
    func shadowLayer() {
        layer.shadowColor = UIColor.shadowColor?.cgColor
//        layer.shadowOpacity = 0.25
//        layer.shadowOffset = CGSize(width: -3, height: 3)
//        layer.shadowRadius = 5
        layer.shadowOpacity = 0.25
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
    static let subTextColor = UIColor(named: "SubTextColor")
    static let shadowColor = UIColor(named: "ShadowColor")
}

extension UITextField {
    func textFont() {
        self.font = UIFont(name: "Roboto-Regular", size: 15)
    }
}

extension UIButton {
    func titleButtonCommonStyle() {
//        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
        self.setTitleColor(UIColor.appTextColor, for: .normal)
        self.backgroundColor = UIColor.appMainBackgroundColor
        layer.cornerRadius = 24
        self.shadowLayer()
    }
}

extension UILabel {
    func labelTextCommonStyle() {
        self.textColor = UIColor.appTextColor
        layer.masksToBounds = false
        self.numberOfLines = 0
    }
    
    func attributedLabel(text: String) {
        let fullText = self.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(text)")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.appPointColor!, range: range)
        attribtuedString.addAttribute(.font, value: UIFont(name: "NotoSansKR-Bold", size: 30)!, range: range)
        self.attributedText = attribtuedString
    }
}
