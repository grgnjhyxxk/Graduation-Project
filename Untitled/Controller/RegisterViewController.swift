//
//  RegisterViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/09.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
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
}

class ProfileSetViewController: RegisterViewController {
    
    var idSetViewList: [UIView] = []
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "프로필을\n작성해주세요.")
    let nameSubTextLabel = RegisterView().subTextLabel(setText: "사용자 이름")
    let dateSubTextLabel = RegisterView().subTextLabel(setText: "생년월일")
    let genderSubTextLabel = RegisterView().subTextLabel(setText: "성별")
    
    let nameSetTextField = RegisterView().textField(setPlaceholder: "홍길동")
    let dateTextField = RegisterView().textField(setPlaceholder: "1999년7월29일")
    
    let genderSegmentedControl = RegisterView().genderSegmentedControl()
    
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
        
        nameSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(20)
            make.leading.equalTo(30)
        }
        
        nameSetTextField.snp.makeConstraints { make in
            make.top.equalTo(nameSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        dateSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(nameSetTextField.snp.bottom).offset(20)
            make.leading.equalTo(30)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(dateSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(dateSubTextLabel).offset(-0.5)
            make.width.equalTo(155)
            make.height.equalTo(40)
        }
        
        genderSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(nameSetTextField.snp.bottom).offset(20)
            make.leading.equalTo(dateTextField.snp.trailing).offset(20)
        }
        
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(dateTextField)
            make.leading.equalTo(dateTextField.snp.trailing).offset(20)
            make.trailing.equalTo(-29.5)
            make.height.equalTo(40)
        }
        
        dateTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        dateTextField.leftViewMode = .always
    }
    
    private func addSubview() {
        idSetViewList = [mainTextLabel, nameSubTextLabel, nameSetTextField, dateSubTextLabel, dateTextField, genderSubTextLabel, genderSegmentedControl]
        
        for uiView in idSetViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "프로필 작성"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let nextButton = UIBarButtonItem(title: "다음", style: .done, target: self, action: #selector(nextButtonAction))
        nextButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = nextButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func cancelButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func nextButtonAction() {
        let rootViewController = IdSetViewController()
        show(rootViewController, sender: nil)
    }
}

class IdSetViewController: RegisterViewController {
    
    var idSetViewList: [UIView] = []
    
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
        idSetViewList = [mainTextLabel, idSubTextLabel, idSetTextField, passwordSubTextLabel, passwordSetTextField, passwordCheckSubTextLabel, passwordCheckSetTextField]
        
        for uiView in idSetViewList {
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
    
    @objc func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func nextButtonAction() {

    }
}
  
