//
//  InitViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class initViewController: UIViewController {
    
    var isLoggedInBool = false
    
    var uiViewList: [UIView] = []
    
    let idInputTextFelid = initView().idInputTextField()
    let passwordTextFelid = initView().PasswordInputTextField()
    let loginButton = initView().loginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
        actionFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
        idInputTextFelid.snp.makeConstraints { make in
            make.top.equalTo(300)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
            make.height.equalTo(40)
        }
        
        passwordTextFelid.snp.makeConstraints { make in
            make.top.equalTo(idInputTextFelid.snp.bottom).offset(5)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFelid.snp.bottom).offset(10)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
            make.height.equalTo(35)
        }
    }
    
    private func addSubview() {
        uiViewList = [idInputTextFelid, passwordTextFelid, loginButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    func isLoggedIn() -> UIViewController {
        if isLoggedInBool {
            let customTabBarController = CustomTabBarController()
            let navigationController = UINavigationController(rootViewController: customTabBarController)
            
            return navigationController
            
        } else {
            return initViewController()
        }
    }
    
    private func actionFunction() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
//        sender.backgroundColor = UIColor.applicationPointColor
        isLoggedInBool = true
        let tabBarController = isLoggedIn()
        tabBarController.modalPresentationStyle = .fullScreen
        
        present(tabBarController, animated: true)
    }
}
