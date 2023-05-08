//
//  InitView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class initView: UIView {
    
    func mainTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "더 편리하고\n가볍게"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        
        return label
    }
    
    func subTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "저희가 삶의 원동력이 되어드릴게요."
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }
    
    func idInputTextField() -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "아이디"
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.layerViewBackgroundColor
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
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.layerViewBackgroundColor
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
        
        button.backgroundColor = UIColor.loginButtonColor
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.07).cgColor
        
        return button
    }
    
    func registerLabel() -> UILabel {
        let label = UILabel()
        
        label.text = "회원이 아니신가요?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.resigterLabelColor
        label.textAlignment = .right
        
        return label
    }
    
    func registerButton() -> UIButton {
        let button = UIButton()
        
        button.setTitle("가입하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .left
        
        return button
    }
    
    func passwordVisibilityButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = UIColor.passwordVisibilityButtonColor
        
        return button
    }
}
