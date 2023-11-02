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
    var isHidden = false

    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appSubBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 20)
    let tableView = UITableView()
    
    let userPofileImage = CommonView().userProfileImageView()

    let mainTitleLabel = CommonView().commonTextLabel(labelText: "", size: 20)

    let profileEditButton = InitView().serviceButton(text: "프로필 수정")
    let logoutButton = InitView().serviceButton(text: "로그아웃")
    let arrowButton = UserView().arrowButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        navigationControllerLayout()
        tableViewLayout()
        actionFunction()
        testBoxAndVitaminDataListInit()
        print(testBoxAndVitaminDataList)
    }
    
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
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(-57.8)
            make.centerX.equalTo(view)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.top.equalTo(profileEditButton.snp.bottom).offset(20)
            make.trailing.equalTo(-20)
            make.size.equalTo(CGSize(width: 23, height: 14))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(arrowButton.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(269.82)
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
        commonUiView.isHidden = isHidden
    }
    
    private func addSubview() {
        uiViewList = [userPofileImage, mainTitleLabel, profileEditButton, commonUiView, logoutButton, arrowButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(commonUiView)
            make.height.equalTo(commonUiView)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [tableView]
        
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
    
    private func tableViewLayout() {
        tableView.register(MyHomeBoxSettingCell.self, forCellReuseIdentifier: "MyHomeBoxSettingCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.appSubBackgroundColor
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
        tableView.layer.cornerRadius = 15
        
        tableView.tableHeaderView = UIView(frame: .zero)
        tableView.tableHeaderView?.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.tableFooterView?.backgroundColor = .clear
    }
    
    private func actionFunction() {
        logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
        profileEditButton.addTarget(self, action: #selector(profileEditButtonAction), for: .touchUpInside)
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        userEditProfileDListInit()
        print("userEditProfileDList 초기화")
        dismiss(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        postBoxAndVitamin() { success in
            if success {
                getBoxAndVitamin { success in
                    if success {
                        self.dismiss(animated: true)
                    }
                }
            } else {
                
            }
        }
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
        LoadingView.show(loadingText: "로그아웃 중")
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name("LogoutNotification"), object: nil)
            UserDefaults.standard.set(false, forKey: "auto")
            UserDefaults.standard.set(String(), forKey: "id")
            UserDefaults.standard.set(String(), forKey: "pwd")
            print(userDataList)
            userDataListInit()
            totalInit()
            hideLoadingScreen()
            userAccountDataListInit()
            vitaminBasicDataListInit()
            vitaminImageDataListInit()
            userEditProfileDList.removeAll()
//            userProfileImageList.removeAll()
            userVitaminDataList.removeAll()
            userVitaminImageDataList.removeAll()
            vitaminNames.removeAll()
            userVitaminSearchDataList.removeAll()
            aiVitaminSearchDataList.removeAll()
            vitaminValues.removeAll()
            alarmViewCellDataList.removeAll()
            perdayTextFieldText.removeAll()
            ingredientsCellDataList.removeAll()
            vitaminNameTextFieldText.removeAll()
            userAlarmDataList.removeAll()
            alarmEditDataList.removeAll()
            boxAndVitaminDataList.removeAll()
            alarmTextFieldText.removeAll()
            repeatDaysDataContractionText.removeAll()
            repeatDaysSelectList.removeAll()
            testBoxAndVitaminDataList.removeAll()
            vitaminNames.removeAll()
            vitaminValues.removeAll()
            vitaminSearchNames.removeAll()
            vitaminSearchValues.removeAll()
            aiVitaminNames.removeAll()
            aiVitaminValues.removeAll()

        }
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        LoadingView.hide()
    }
    
    @objc func arrowButtonTapped(_ sender: UIButton) {
        if isHidden {
            // 숨겨진 뷰를 보여줍니다.
            UIView.animate(withDuration: 0.3) {
                self.commonUiView.isHidden = false
            }
            isHidden = false
        } else {
            // 보여진 뷰를 숨깁니다.
            UIView.animate(withDuration: 0.3) {
                self.commonUiView.isHidden = true
            }
            isHidden = true
        }
    }
}

extension UserViewContoller: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyHomeBoxSettingCell", for: indexPath) as! MyHomeBoxSettingCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        cell.titleLabel.text = boxCellData[indexPath.row].title
        
        let vseq = boxAndVitaminDataList[indexPath.row].vseq
        var prod_name = String()
        
        for i in 0..<userVitaminDataList.count {
            if userVitaminDataList[i].vseq == vseq {
                prod_name = userVitaminDataList[i].prod_name
            }
        }
        
        cell.vitaminTextField.text = prod_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MyHomeBoxSettingCell else {
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

