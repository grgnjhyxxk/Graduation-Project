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
    let warningLabel = RegisterView().warningLabel()

    let idSetTextField = RegisterView().textField(setPlaceholder: "아이디")
    let passwordSetTextField = RegisterView().textField(setPlaceholder: "비밀번호")
    let passwordCheckSetTextField = RegisterView().textField(setPlaceholder: "비밀번호 재입력")
    
    let passwordVisibilityButton = InitView().passwordVisibilityButton()
    let passwordCheckVisibilityButton = InitView().passwordVisibilityButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("계정정보작성화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        navigationControllerLayout()
        actionFunction()
        delegateFunction()
    }
    
    private func viewLayout() {
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(30)
        }
        
        idSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(30)
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
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckSetTextField.snp.bottom).offset(5)
            make.leading.equalTo(passwordCheckSubTextLabel)
        }
        
        passwordVisibilityButton.snp.makeConstraints { make in
            make.top.equalTo(passwordSetTextField).offset(8.5)
            make.trailing.equalTo(passwordSetTextField).offset(-8.5)
        }
        
        passwordCheckVisibilityButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckSetTextField).offset(8.5)
            make.trailing.equalTo(passwordCheckSetTextField).offset(-8.5)
        }
        
        passwordSetTextField.isSecureTextEntry = true
        passwordCheckSetTextField.isSecureTextEntry = true
    }
    
    private func addSubview() {
        subViewList = [mainTextLabel, idSubTextLabel, idSetTextField, passwordSubTextLabel, passwordSetTextField, passwordCheckSubTextLabel, passwordCheckSetTextField, warningLabel, passwordVisibilityButton, passwordCheckVisibilityButton]
        
        for uiView in subViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "계정 생성"
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(backButtonAction))
        backButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = backButton
        
        let nextButton = UIBarButtonItem(title: "다음", style: .done, target: self, action: #selector(nextButtonAction))
        nextButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = nextButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    private func checkTextFieldsAreFilled() -> Bool {
        for textField in [idSetTextField, passwordSetTextField, passwordCheckSetTextField] {
            if textField.text?.isEmpty ?? true {
                return false
            }
        }
        return true
    }
    
    private func actionFunction() {
        passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        passwordCheckVisibilityButton.addTarget(self, action: #selector(passwordCheckVisibilityButtonTapped), for: .touchUpInside)
    }
    
    private func delegateFunction() {
        idSetTextField.delegate = self
        passwordSetTextField.delegate = self
        passwordCheckSetTextField.delegate = self
    }
    
    @objc func passwordVisibilityButtonTapped(_ sender: UIButton) {
        passwordSetTextField.isSecureTextEntry.toggle()
        let imageName = passwordSetTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func passwordCheckVisibilityButtonTapped(_ sender: UIButton) {
        passwordCheckSetTextField.isSecureTextEntry.toggle()
        let imageName = passwordCheckSetTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonAction() {
        let rootViewController = SerialNumberSetViewController()

        if !checkTextFieldsAreFilled() {
            warningLabel.text = "모든 값을 입력하셔야 합니다."
            warningLabel.isHidden = false
        } else if passwordSetTextField.text != passwordCheckSetTextField.text {
            warningLabel.text = "비밀번호 입력이 서로 다릅니다."
            warningLabel.isHidden = false
        } else {
            userAccountDataList[userAccountDataList.count - 1].userid = idSetTextField.text!
            userAccountDataList[userAccountDataList.count - 1].userpassword = passwordSetTextField.text!

        show(rootViewController, sender: nil)
        }
    }
}

extension AccountSetViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idSetTextField {
            passwordSetTextField.becomeFirstResponder()
        } else if textField == passwordSetTextField {
            passwordCheckSetTextField.becomeFirstResponder()
        } else if textField == passwordCheckSetTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
