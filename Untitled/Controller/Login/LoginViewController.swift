//
//  InitViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var isLoggedInBool = false
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let mainImageView = InitView().mainImageView()
    
    let mainTextLabel = InitView().mainTextLabel()
    let subTextLabel = InitView().subTextLabel()
    let registerLabel = InitView().serviceLabel(text: "회원이 아니신가요?")
    let autoLoginLabel = CommonView().commonTextLabel(labelText: "자동로그인", size: 13)
    let saveIdLabel = CommonView().commonTextLabel(labelText: "아이디 저장", size: 13)

    let idInputTextField = InitView().idInputTextField()
    let PasswordInputTextField = InitView().PasswordInputTextField()
    
    let passwordVisibilityButton = InitView().passwordVisibilityButton()
    let loginButton = InitView().loginButton()
    let findButton = InitView().serviceButton(text: "아이디/비밀번호 찾기")
    let registerButton = InitView().serviceButton(text: "가입하기")
    let autoLoginButton = InitView().toggleButton()
    let saveIdButton = InitView().toggleButton()

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("로그인이 로드되었습니다.")
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        actionFunction()
        delegateFunction()
        hideKeyboardWhenTappedAround()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
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
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.trailing.equalTo(5)
            make.size.equalTo(CGSize(width: 190, height: 190))
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
        
        autoLoginButton.snp.makeConstraints { make in
            make.top.equalTo(PasswordInputTextField.snp.bottom).offset(10)
            make.leading.equalTo(25)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        autoLoginLabel.snp.makeConstraints { make in
            make.top.equalTo(autoLoginButton).offset(4.5)
            make.leading.equalTo(autoLoginButton.snp.trailing).offset(0)
        }
        
        saveIdButton.snp.makeConstraints { make in
            make.top.equalTo(autoLoginButton)
            make.leading.equalTo(autoLoginLabel.snp.trailing).offset(10)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        saveIdLabel.snp.makeConstraints { make in
            make.top.equalTo(saveIdButton).offset(4.5)
            make.leading.equalTo(saveIdButton.snp.trailing).offset(0)
        }
        
        findButton.snp.makeConstraints { make in
            make.top.equalTo(saveIdButton).offset(-2)
            make.trailing.equalTo(PasswordInputTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(autoLoginButton.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(35)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(300)
            make.leading.equalTo(116)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(registerLabel).offset(-6.8)
            make.leading.equalTo(registerLabel.snp.trailing).offset(5)
        }
        
        findButton.titleLabel?.textAlignment = .right
        findButton.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
    
    private func addOnCommonUiView() {
        commonViewList = [mainImageView, mainTextLabel, subTextLabel, idInputTextField, PasswordInputTextField, passwordVisibilityButton, autoLoginButton, autoLoginLabel, saveIdButton, saveIdLabel, findButton, loginButton, registerLabel, registerButton]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    func isLoggedIn() -> UIViewController {
        if isLoggedInBool {
            return CustomTabBarController()
            
        } else {
            return LoginViewController()
        }
    }
    
    private func actionFunction() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        autoLoginButton.addTarget(self, action: #selector(autoLoginButtonAction), for: .touchUpInside)
        saveIdButton.addTarget(self, action: #selector(saveIdButtonAction), for: .touchUpInside)
    }
    
    private func delegateFunction() {
        idInputTextField.delegate = self
        PasswordInputTextField.delegate = self
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        isLoggedInBool = true
        let tabBarController = isLoggedIn()
        tabBarController.modalPresentationStyle = .fullScreen
        
        loginUserToServer(userid: idInputTextField.text!, userpassword: PasswordInputTextField.text!) { success in
            if success {
                print("로그인이 성공하였습니다.")
                self.present(tabBarController, animated: true)
            } else {
                print("로그인이 실패하였습니다.")
            }
        }
    }
    
    @objc func passwordVisibilityButtonTapped(_ sender: UIButton) {
        PasswordInputTextField.isSecureTextEntry.toggle()
        let imageName = PasswordInputTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func registerButtonAction(_ sender: UIButton) {
        let rootViewController = ProfileSetViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func autoLoginButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let imageName = sender.isSelected ? "checkmark.circle.fill" : "circle"
        let tintColor = sender.isSelected ? UIColor.appPointColor : UIColor.placeholderText
        sender.setImage(UIImage(systemName: imageName), for: .normal)
        sender.tintColor = tintColor
    }
    
    @objc func saveIdButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let imageName = sender.isSelected ? "checkmark.circle.fill" : "circle"
        let tintColor = sender.isSelected ? UIColor.appPointColor : UIColor.placeholderText
        sender.setImage(UIImage(systemName: imageName), for: .normal)
        sender.tintColor = tintColor
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idInputTextField {
            PasswordInputTextField.becomeFirstResponder()
            
        } else if textField == PasswordInputTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
