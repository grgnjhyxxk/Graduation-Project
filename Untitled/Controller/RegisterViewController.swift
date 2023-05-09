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
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
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
}

class ProfileSetViewController: RegisterViewController {
    
    var idSetViewList: [UIView] = []
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "프로필을\n작성해주세요.")
    
    let idSetTextField = RegisterView().nameSetTextField()
    
    let separatorView = RegisterView().separatorView()
    
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
        
        idSetTextField.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(31)
            make.trailing.equalToSuperview().offset(-31)
            make.top.equalTo(idSetTextField.snp.bottom).offset(20)
            make.height.equalTo(0.5)
        }
    }
    
    private func addSubview() {
        idSetViewList = [mainTextLabel, separatorView, idSetTextField]
        
        for uiView in idSetViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "회원가입"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
        
        let nextButton = UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(nextButtonAction))
        nextButton.tintColor = .white
        navigationItem.rightBarButtonItem = nextButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
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
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "아이디를\n입력해주세요.")
    let idSetTextField = RegisterView().idSetTextField()
    
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
        
        idSetTextField.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    private func addSubview() {
        idSetViewList = [mainTextLabel, idSetTextField]
        
        for uiView in idSetViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "회원가입"
        
        let nextButton = UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(nextButtonAction))
        nextButton.tintColor = .white
        navigationItem.rightBarButtonItem = nextButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc func cancelButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func nextButtonAction() {

    }
}
  
