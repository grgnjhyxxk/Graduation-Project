//
//  CommonView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/01.
//

import UIKit

class CommonView: UIView {
    
    func roundingButton() -> UIView {
        let button = UIButton()
        
        button.setImage(UIImage(named: "TemporaryUserProfilePicture"), for: .normal)
        button.backgroundColor = UIColor.appSubBackgroundColor
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 22.5
        button.clipsToBounds = true
        button.appButtonCommonStyle()
        
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
        label.font = UIFont.boldSystemFont(ofSize: size)
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
}
