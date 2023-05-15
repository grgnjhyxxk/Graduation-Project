//
//  UserViewContoller.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit
import SnapKit

class UserViewContoller: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let userPofileImage = RegisterView().selectUserProfileImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        navigationControllerLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        userPofileImage.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.trailing.equalTo(-20)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        userPofileImage.layer.cornerRadius = 40
    }
    
    private func addSubview() {
        uiViewList = [userPofileImage]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        
    }
    
    private func addOnCommonUiView() {
        commonViewList = []
        
        for uiView in commonViewList {
            
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "마이홈"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = UIColor.appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonAction))
        saveButton.tintColor = UIColor.appPointColor
        navigationItem.rightBarButtonItem = saveButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        
    }
}

