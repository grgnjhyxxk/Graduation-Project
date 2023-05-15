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
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appSubBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    let userPofileImage = RegisterView().selectUserProfileImageView()

    let mainTitleLabel = CommonView().commonTextLabel(labelText: "임재혁 님\n오늘도 와주셨네요!", size: 20)
    let pillViewTtileLabel = CommonView().commonTextLabel(labelText: "내 영양제", size: 20)

    let profileEditButton = InitView().serviceButton(text: "프로필 수정")
    let plusbutton = AlarmView().plusButton()
    let logoutButton = InitView().serviceButton(text: "로그아웃")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        navigationControllerLayout()
        actionFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        userPofileImage.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.trailing.equalTo(-20)
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userPofileImage).offset(7)
            make.leading.equalTo(20)
        }
        
        profileEditButton.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom)
            make.leading.equalTo(mainTitleLabel)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(profileEditButton.snp.bottom).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(150)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(-57.8)
            make.centerX.equalTo(view)
        }
        
        userPofileImage.layer.cornerRadius = 35
        mainTitleLabel.attributedLabel(text: "임재혁")
        mainTitleLabel.font = UIFont(name: "Roboto-Bold", size: 25)
        logoutButton.setTitleColor(UIColor.systemRed, for: .normal)
    }
    
    private func addSubview() {
        uiViewList = [userPofileImage, mainTitleLabel, profileEditButton, commonUiView, logoutButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        plusbutton.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.trailing.equalTo(-15)
            make.size.equalTo(CGSize(width: 23, height: 23))
        }
        
        pillViewTtileLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(15)
        }
        
        pillViewTtileLabel.font = UIFont(name: "Roboto-Bold", size: 15)
    }
    
    private func addOnCommonUiView() {
        commonViewList = [plusbutton, pillViewTtileLabel]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
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
    
    private func actionFunction() {
        logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func logoutButtonAction(_ sender: UIButton) {
        showLoadingScreen()
        print("로그아웃버튼 isSelected")
        NotificationCenter.default.post(name: NSNotification.Name("LogoutNotification"), object: nil)
        presentingViewController?.presentingViewController?.presentedViewController?.dismiss(animated: true)        

        hideLoadingScreen()
    }

}

