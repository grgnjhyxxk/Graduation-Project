//
//  UserProfileGenderSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/17.
//

import UIKit
import SnapKit

class UserProfileGenderSelectViewController: UserProfileNameSelectViewController {
    
    let maleButton = CommonView().radioButton()
    let femaleButton = CommonView().radioButton()
    
    let maleLabel = CommonView().commonTextLabel(labelText: "남자", size: 15)
    let femaleLabel = CommonView().commonTextLabel(labelText: "여자", size: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationControllerLayout()
        actionFunction()
    }
    
    private func layout() {
        titleLabel.text = "변경할 성별을 선택해주세요"
        textField.isHidden = true
        
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        view.addSubview(maleLabel)
        view.addSubview(femaleLabel)
        
        maleButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.trailing.equalTo(-15)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        maleLabel.snp.makeConstraints { make in
            make.top.equalTo(maleButton)
            make.leading.equalTo(15)
        }
        
        femaleButton.snp.makeConstraints { make in
            make.top.equalTo(maleButton.snp.bottom).offset(15)
            make.trailing.equalTo(-15)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
            
        femaleLabel.snp.makeConstraints { make in
            make.top.equalTo(femaleButton)
            make.leading.equalTo(15)
        }
        
        maleLabel.font = UIFont(name: "NotoSansKR-Regular", size: 16.5)
        femaleLabel.font = UIFont(name: "NotoSansKR-Regular", size: 16.5)
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "성별"
        
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
    
    private func actionFunction() {
        maleButton.addTarget(self, action: #selector(radioButtonTapped(_:)), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(radioButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func radioButtonTapped(_ sender: UIButton) {
            // 선택한 버튼을 선택 상태로 변경하고, 다른 버튼들은 선택 해제
            if sender == maleButton {
                maleButton.isSelected = true
                femaleButton.isSelected = false
            } else if sender == femaleButton {
                maleButton.isSelected = false
                femaleButton.isSelected = true
            }
            
            // 선택된 버튼에 따라 이미지 변경
            maleButton.setImage(UIImage(systemName: maleButton.isSelected ? "circle.inset.filled" : "circle"), for: .normal)
            femaleButton.setImage(UIImage(systemName: femaleButton.isSelected ? "circle.inset.filled" : "circle"), for: .normal)
        
            maleButton.tintColor = maleButton.isSelected ? UIColor.appPointColor : UIColor.systemGray3
            femaleButton.tintColor = femaleButton.isSelected ? UIColor.appPointColor : UIColor.systemGray3
        
            // 선택된 버튼에 따른 동작 수행
            if maleButton.isSelected {
                // 남자 선택 시 동작
                print("남자 선택")
            } else if femaleButton.isSelected {
                // 여자 선택 시 동작
                print("여자 선택")
            }
        }
    
    @objc override func cancelButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc override func saveButtonAction(_ sender: UIBarButtonItem) {
        
    }
}
