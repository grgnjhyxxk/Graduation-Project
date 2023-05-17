//
//  CommonView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/01.
//

import UIKit

class CommonView: UIView {
    
    func roundingButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(named: "TemporaryUserProfilePicture"), for: .normal)
        button.backgroundColor = UIColor.appSubBackgroundColor
        button.layer.cornerRadius = 22.5
        button.clipsToBounds = true
        
        return button
    }
    
    func userInterfaceStyleToggleButton() -> UIButton {
        let button = UIButton()
        
        if traitCollection.userInterfaceStyle == .dark {
            button.setImage(UIImage(systemName: "moon.circle.fill"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "sun.max.circle.fill"), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.appPointColor
        
        return button
    }
    
    func titleTextButton(titleText: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle("\(titleText)", for: .normal)
        button.titleButtonCommonStyle()
        
        return button
    }
    
    func commonTextLabel(labelText: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.text = "\(labelText)"
//        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "NotoSansKR-Regular", size: size)
        label.numberOfLines = 0
        label.labelTextCommonStyle()
        
        return label
    }
    
    func commonUiView(backgroundColor: UIColor, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) -> UIView {
        let uiView = UIView()
  
        uiView.backgroundColor = backgroundColor
        uiView.layer.borderWidth = borderWidth
        uiView.layer.borderColor = borderColor.cgColor
        uiView.layer.cornerRadius = cornerRadius
        
        return uiView
    }
    
    func birthToDate(birth: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        if let date = dateFormatter.date(from: birth) {
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            let formattedBirthday = dateFormatter.string(from: date)
            return formattedBirthday
        } else {
            return "Invalid birthday format"
        }
    }
}
