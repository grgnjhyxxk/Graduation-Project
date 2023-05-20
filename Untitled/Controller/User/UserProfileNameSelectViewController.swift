//
//  UserProfileNameSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/17.
//

import UIKit
import SnapKit

class UserProfileNameSelectViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    
    let textField = RegisterView().textField(setPlaceholder: "")
    
    let titleLabel = CommonView().commonTextLabel(labelText: "", size: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        navigationControllerLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(15)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(40)
        }
       
        titleLabel.textColor = UIColor.systemGray
        titleLabel.text = "변경할 이름을 입력해주세요"
        titleLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        textField.text = userDataList[0].name
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
    }
    
    private func addSubview() {
        uiViewList = [textField, titleLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "사용자 이름"
        
        let cancelButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = UIColor.appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveButtonAction))
        saveButton.tintColor = UIColor.appPointColor
        navigationItem.rightBarButtonItem = saveButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        
    }
}

