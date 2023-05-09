//
//  RegisterView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/09.
//

import UIKit

class RegisterView: UIView {
    
    func mainTextLabel(setText: String) -> UIView {
        let label = UILabel()
        
        label.text = "\(setText)"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        
        return label
    }
    
    func separatorView() -> UIView {
        let view = UIView()
        
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        return view
    }
    
    func nameSetTextField() -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "이름"
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.layerViewBackgroundColor
        textField.layer.cornerRadius = 5
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
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
