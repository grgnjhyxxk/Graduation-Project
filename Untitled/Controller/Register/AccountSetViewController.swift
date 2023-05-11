//
//  AccountSetViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/11.
//

import UIKit
import SnapKit

class AccountSetViewController: RegisterRootViewController {
    
    var subViewList: [UIView] = []
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "계정 정보를\n설정해주세요.")
    let idSubTextLabel = RegisterView().subTextLabel(setText: "아이디")
    let passwordSubTextLabel = RegisterView().subTextLabel(setText: "비밀번호")
    let passwordCheckSubTextLabel = RegisterView().subTextLabel(setText: "비밀번호 재입력")

    let idSetTextField = RegisterView().textField(setPlaceholder: "아이디")
    let passwordSetTextField = RegisterView().textField(setPlaceholder: "비밀번호")
    let passwordCheckSetTextField = RegisterView().textField(setPlaceholder: "비밀번호 재입력")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        navigationControllerLayout()
    }
    
    private func viewLayout() {
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(90)
            make.leading.equalTo(30)
        }
        
        idSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(20)
            make.leading.equalTo(30)
        }
        
        idSetTextField.snp.makeConstraints { make in
            make.top.equalTo(idSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(idSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        passwordSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(idSetTextField.snp.bottom).offset(20)
            make.leading.equalTo(30)
        }
        
        passwordSetTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(passwordSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        passwordCheckSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordSetTextField.snp.bottom).offset(20)
            make.leading.equalTo(30)
        }
        
        passwordCheckSetTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(passwordCheckSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        passwordSetTextField.isSecureTextEntry = true
        passwordCheckSetTextField.isSecureTextEntry = true
    }
    
    private func addSubview() {
        subViewList = [mainTextLabel, idSubTextLabel, idSetTextField, passwordSubTextLabel, passwordSetTextField, passwordCheckSubTextLabel, passwordCheckSetTextField]
        
        for uiView in subViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "계정 생성"
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(backButtonAction))
        backButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = backButton
        
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonAction))
        doneButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonAction() {
        
    }
}
  
