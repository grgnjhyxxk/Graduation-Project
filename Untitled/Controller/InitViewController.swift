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
    var commonViewList: [UIView] = []

    let idInputTextFelid = initView().idInputTextField()
    let passwordTextFelid = initView().PasswordInputTextField()
    let loginButton = initView().loginButton()
    
    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        actionFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
        commonUiView.snp.makeConstraints { make in
//            make.top.equalTo(view).offset(330)
//            make.leading.equalTo(25)
//            make.trailing.equalTo(-25)
//            make.height.equalTo(180)
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
        idInputTextFelid.snp.makeConstraints { make in
            make.top.equalTo(355)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        passwordTextFelid.snp.makeConstraints { make in
            make.top.equalTo(idInputTextFelid.snp.bottom).offset(5)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFelid.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(35)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [idInputTextFelid, passwordTextFelid, loginButton]
        
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
