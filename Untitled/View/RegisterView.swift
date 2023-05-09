//
//  RegisterView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/09.
//

import UIKit

class RegisterView: UIView {
    
    func mainTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "아이디를 입력해주세요"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }
    
    func idSetTextField() -> UITextField {
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
}
