//
//  UserViewContoller.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit
import SnapKit

class UserViewContoller: UIViewController {
//    var serialNumber = String()
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appSubBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 20)

//    let userPofileImage = RegisterView().selectUserProfileImageView()
    let userPofileImage = CommonView().userProfileImageView()

    let mainTitleLabel = CommonView().commonTextLabel(labelText: "", size: 20)
    let pillViewTtileLabel = CommonView().commonTextLabel(labelText: "이 부분은 삭제할거임.", size: 20)
//    let serialNumber = CommonView().commonTextLabel(labelText: "", size: <#T##CGFloat#>)

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
//        NotificationCenter.default.addObserver(self, selector: #selector(handleImageEditedNotification), name: NSNotification.Name(rawValue: "ImageEdited"), object: nil)
    }
    
//    @objc func handleImageEditedNotification(_ noti: Notification) {
//        OperationQueue.main.addOperation {
//            profileEditDataPost() { success in
//                if success {
//                    print("성공")
//                } else {
//                    print("실패")
//                }
//            }
//        }
//    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        let dividerView = UIView(frame: CGRect(x: 0, y: (navigationController?.navigationBar.frame.maxY)! + 53, width: view.frame.width, height: 1))
        dividerView.backgroundColor = UIColor.systemGray6
        navigationController?.view.addSubview(dividerView)
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(20)
        }
        
        userPofileImage.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel)
            make.trailing.equalTo(-20)
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        
        profileEditButton.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom)
            make.leading.equalTo(mainTitleLabel)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(profileEditButton.snp.bottom).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(120)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(-57.8)
            make.centerX.equalTo(view)
        }
        
        let name = userDataList[0].name
        userPofileImage.backgroundColor = UIColor.appSubBackgroundColor
        userPofileImage.layer.cornerRadius = 35
        mainTitleLabel.text = "\(name) 님\n오늘도 와주셨네요!"
        mainTitleLabel.attributedLabel(text: "\(name)")
        mainTitleLabel.font = UIFont(name: "Roboto-Bold", size: 25)
        profileEditButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 13)
        profileEditButton.setTitleColor(UIColor.subTextColor, for: .normal)
        logoutButton.setTitleColor(UIColor.systemRed, for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 14.5)
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
        
        let cancelButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(cancelButtonAction))
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
        profileEditButton.addTarget(self, action: #selector(profileEditButtonAction), for: .touchUpInside)
        plusbutton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
    }
    
    @objc func plusButtonAction(_ sender: UIButton) {
 
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        userEditProfileDListInit()
        print("userEditProfileDList 초기화")
        dismiss(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func profileEditButtonAction(_ sender: UIButton) {
        let rootViewControoler = UserProfileEditViewController()
        let name = userDataList[0].name
        let birth = userDataList[0].birth
        let gender = userDataList[0].gender
        let image = userPofileImage.image
        userEditProfileDList.append(UserEditProfileData(name: name, gender: gender, birth: birth, image: image!))
        print(userEditProfileDList)
        show(rootViewControoler, sender: nil)
    }
    
    @objc func logoutButtonAction(_ sender: UIButton) {
        showLoadingScreen()
        print("로그아웃버튼 isSelected")
        NotificationCenter.default.post(name: NSNotification.Name("LogoutNotification"), object: nil)
        presentingViewController?.presentingViewController?.dismiss(animated: true)
        UserDefaults.standard.set(false, forKey: "auto")
        UserDefaults.standard.set(String(), forKey: "id")
        UserDefaults.standard.set(String(), forKey: "pwd")
        print(userDataList)
        userDataListInit()
        hideLoadingScreen()
    }

}

