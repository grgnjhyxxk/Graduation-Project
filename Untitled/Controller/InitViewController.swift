//
//  InitViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class InitViewController: UIViewController {
    
    var isLoggedInBool = false
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let mainTextLabel = InitView().mainTextLabel()
    let subTextLabel = InitView().subTextLabel()
    let registerLabel = InitView().registerLabel()
    
    let idInputTextField = InitView().idInputTextField()
    let PasswordInputTextField = InitView().PasswordInputTextField()
    
    let passwordVisibilityButton = InitView().passwordVisibilityButton()
    let loginButton = InitView().loginButton()
    let registerButton = InitView().registerButton()
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        actionFunction()
        delegateFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
        commonUiView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(90)
            make.leading.equalTo(view).offset(27)
        }

        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(22)
            make.leading.equalTo(mainTextLabel)
        }
        
        idInputTextField.snp.makeConstraints { make in
            make.top.equalTo(305)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        PasswordInputTextField.snp.makeConstraints { make in
            make.top.equalTo(idInputTextField.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        passwordVisibilityButton.snp.makeConstraints { make in
            make.top.equalTo(PasswordInputTextField).offset(8.5)
            make.trailing.equalTo(PasswordInputTextField).offset(-8.5)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(PasswordInputTextField.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(35)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(330)
            make.leading.equalTo(116)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(registerLabel).offset(-5.8)
            make.leading.equalTo(registerLabel.snp.trailing).offset(5)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [mainTextLabel, subTextLabel, idInputTextField, PasswordInputTextField, passwordVisibilityButton, loginButton, registerLabel, registerButton]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    func isLoggedIn() -> UIViewController {
        if isLoggedInBool {
            let customTabBarController = CustomTabBarController()
            let navigationController = UINavigationController(rootViewController: customTabBarController)
            
            return navigationController
            
        } else {
            return InitViewController()
        }
    }
    
    private func actionFunction() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
    }
    
    private func delegateFunction() {
        idInputTextField.delegate = self
        PasswordInputTextField.delegate = self
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
//        sender.backgroundColor = UIColor.applicationPointColor
        isLoggedInBool = true
        let tabBarController = isLoggedIn()
        tabBarController.modalPresentationStyle = .fullScreen
        
        present(tabBarController, animated: true)
    }
    
    @objc func passwordVisibilityButtonTapped(_ sender: UIButton) {
        PasswordInputTextField.isSecureTextEntry.toggle()
        let imageName = PasswordInputTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func registerButtonAction(_ sender: UIButton) {
        let rootViewController = RegisterViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension InitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idInputTextField {
            PasswordInputTextField.becomeFirstResponder()
            
        } else if textField == PasswordInputTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
