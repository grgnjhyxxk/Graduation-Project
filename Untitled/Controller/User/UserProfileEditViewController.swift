//
//  UserProfileViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit
import SnapKit

class UserProfileEditViewController: UIViewController {
    let datePicker = UIDatePicker()
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()
    let topDivideView = UIView()
    let bottomDivideView = UIView()
    
//    let userPofileImage = RegisterView().selectUserProfileImageView()
    let userPofileImage = CommonView().userProfileImageView()
    
    let profileImageEditButton = InitView().serviceButton(text: "프로필 사진변경")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        tableViewLayout()
        navigationControllerLayout()
        actionFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        userPofileImage.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 84, height: 84))
        }
        
        profileImageEditButton.snp.makeConstraints { make in
            make.top.equalTo(userPofileImage.snp.bottom)
            make.width.equalTo(view)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(profileImageEditButton.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(179.82)
        }
        
        topDivideView.snp.makeConstraints { make in
            make.top.equalTo(commonUiView)
            make.width.equalTo(view)
            make.height.equalTo(1)
        }
        
        bottomDivideView.snp.makeConstraints { make in
            make.top.equalTo(commonUiView.snp.bottom)
            make.width.equalTo(view)
            make.height.equalTo(1)
        }
        
        topDivideView.backgroundColor = UIColor.systemGray6
        bottomDivideView.backgroundColor = UIColor.systemGray6
        userPofileImage.layer.cornerRadius = 42
        profileImageEditButton.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
    }
    
    private func addSubview() {
        uiViewList = [userPofileImage, profileImageEditButton, commonUiView, topDivideView, bottomDivideView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(commonUiView)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(UserProfileEditViewTableCell.self, forCellReuseIdentifier: "UserProfileEditViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .singleLine
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "프로필 수정"
        
        let cancelButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelButtonAction))
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
        profileImageEditButton.addTarget(self, action: #selector(profileImageEditButtonTapped), for: .touchUpInside)
    }
    
    @objc func profileImageEditButtonTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "사진 선택", style: .default) { _ in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        })
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(UIAlertAction(title: "카메라", style: .default) { _ in
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            })
        }
        
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension UserProfileEditViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileEditViewCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileEditViewTableCell", for: indexPath) as! UserProfileEditViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear

        let titlaLabelText = profileEditViewCellData[indexPath.row].title
        
        switch indexPath.row {
        case 0:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: false, birthTextFieldBool: true, genderLabelBool: true, serialNumberLabelBool: true)
        case 1:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, birthTextFieldBool: false, genderLabelBool: true, serialNumberLabelBool: true)
        case 2:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, birthTextFieldBool: true, genderLabelBool: false, serialNumberLabelBool: true)
        case 3:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, birthTextFieldBool: true, genderLabelBool: true, serialNumberLabelBool: false)
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var rootViewController = UIViewController()
        switch indexPath.row {
        case 0:
            rootViewController = UserProfileNameSelectViewController()
            show(rootViewController, sender: nil)
        case 1:
            rootViewController = UserProfileBirthSelectViewController()
            show(rootViewController, sender: nil)
        case 2:
            rootViewController = UserProfileGenderSelectViewController()
            show(rootViewController, sender: nil)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension UserProfileEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let pickedImage = info[.originalImage] as? UIImage {
            userPofileImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
