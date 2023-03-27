//
//  UIViewController+Extension.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

extension UIViewController {
    func setSameBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 38/255, green: 151/255, blue: 255/255, alpha: 0.57).cgColor, UIColor(red: 171/255, green: 79/255, blue: 13/255, alpha: 0.57).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    static let customColor = UIColor(red: 149/255, green: 161/255, blue: 177/255, alpha: 0.85)
    static let customColor2 = UIColor(red: 129/255, green: 141/255, blue: 157/255, alpha: 0.85)
}
