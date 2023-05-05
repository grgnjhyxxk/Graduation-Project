//
//  InitView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class initView: UIView {
    
    func loginButton() -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.white
        button.setTitle("기존 계정으로 로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.layer.cornerRadius = 7.5
        
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
