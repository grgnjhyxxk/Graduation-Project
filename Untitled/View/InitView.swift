//
//  InitView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class initView: UIView {
    
    func idInputTextField() -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "아이디"
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.white.withAlphaComponent(0.07)
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
        textField.backgroundColor = UIColor.white.withAlphaComponent(0.07)
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        
        return textField
    }
    
    func loginButton() -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.07).cgColor
        
        return button
    }
    
    func findIdPasswordTextLabel() -> UILabel {
        let label = UILabel()
        
        label.text = "아이디 / 비밀번호 찾기"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11)
        
        return label
    }
    
    func signUpTextLabel() -> UILabel {
        let label = UILabel()
        
        label.text = "회원가입"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11)
        
        return label
    }
}
