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
    var commonViewList: [UIView] = []

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    let mainTextLabel = RegisterView().mainTextLabel()
    
    let idSetTextField = RegisterView().idSetTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        navigationControllerLayout()
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
            make.top.equalTo(110)
            make.leading.equalTo(30)
        }
        
        idSetTextField.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [mainTextLabel, idSetTextField]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
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
        
        dismiss(animated: true, completion: nil)
    }
}
  
