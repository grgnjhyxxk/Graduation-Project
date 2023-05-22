//
//  UserProfileBirthSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/17.
//

import UIKit
import SnapKit

class UserProfileBirthSelectViewController: UserProfileNameSelectViewController {
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationControllerLayout()
        createDatePicker()
    }
    
    private func layout() {
        titleLabel.text = "변경할 생년월일을 선택해주세요"
        textField.text = CommonView().birthToDate(birth: String(userDataList[0].birth))
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "생년월일"
        
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
    
    private func createDatePicker() {
        let toolbar = UIToolbar()

        let saveButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(birthSaveButtonAction))

        let toolbarItems = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            saveButton
        ]
        
        toolbar.sizeToFit()
        toolbar.items = toolbarItems
        toolbar.tintColor = .appPointColor
        
        datePicker.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.overrideUserInterfaceStyle = .unspecified
        datePicker.locale = Locale(identifier: "ko_KR")

        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
    }
    
    @objc func birthSaveButtonAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        let dateString = dateFormatter.string(from: datePicker.date)
        textField.text = dateString
        
        self.view.endEditing(true)
    }
    
    @objc override func cancelButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc override func saveButtonAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
