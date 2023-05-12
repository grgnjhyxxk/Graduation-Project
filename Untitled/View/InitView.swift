//
//  InitView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class InitView: UIView {
    
    func mainImageView() -> UIImageView {
        let imageView = UIImageView()
            
        imageView.image = UIImage(named: "InitViewMainImage")
        
        return imageView
    }
    
    func mainTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "더 편리하고\n가볍게"
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 40)
        label.numberOfLines = 0
        
        return label
    }
    
    func subTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "저희가 삶의 원동력이\n되어드릴게요."
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.systemFont(ofSize: 15)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 15)
        label.numberOfLines = 0

        return label
    }
    
    func idInputTextField() -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "아이디"
        textField.textColor = UIColor.appTextColor
        textField.backgroundColor = UIColor.appSubBackgroundColor
        
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        
        return textField
    }
    
    func PasswordInputTextField() -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "비밀번호"
        textField.textColor = UIColor.appTextColor
        textField.backgroundColor = UIColor.appSubBackgroundColor
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        
        textField.isSecureTextEntry = true
        
        return textField
    }
    
    func loginButton() -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.appPointColor
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.loginButtonTextColor, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 18.5)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.07).cgColor
        
        return button
    }
    
    func toggleButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = UIColor.placeholderText
        
        return button
    }
    
    func serviceLabel(text: String) -> UILabel {
        let label = UILabel()
        
        label.text = "\(text)"
//        label.font = UIFont.systemFont(ofSize: 14)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.textColor = UIColor.resigterLabelColor
        label.textAlignment = .right
        
        return label
    }
    
    func serviceButton(text: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle("\(text)", for: .normal)
        button.setTitleColor(UIColor.appPointColor, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        button.setTitleColor(UIColor.darkGray, for: .highlighted)
        button.titleLabel?.textAlignment = .left
        
        return button
    }
    
    func passwordVisibilityButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = UIColor.appPointColor
        
        return button
    }
}
