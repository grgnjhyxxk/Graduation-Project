//
//  MyHomeBoxSettingCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/31.
//

import UIKit
import SnapKit

class MyHomeBoxSettingCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    var pickerView = UIPickerView()
    
    var vitaminNames = [String]()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let vitaminTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.placeholder = "선택안함"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(10)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(12.5)
        }
        
        vitaminTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, vitaminTextField]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    private func textFieldSetting() {
        vitaminNames.append("선택안함")
        for prod_name in userVitaminDataList {
            vitaminNames.append(prod_name.prod_name)
        }
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor.appMainBackgroundColor
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(tooBarCancelButtonAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(tooBarDoneButtonAction))
        
        toolbar.barTintColor = .appMainBackgroundColor
        toolbar.isTranslucent = true
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.appMainBackgroundColor
        vitaminTextField.inputView = pickerView
        vitaminTextField.inputAccessoryView = toolbar
    }
    
    @objc func tooBarCancelButtonAction() {
        vitaminTextField.resignFirstResponder()
    }
    
    @objc func tooBarDoneButtonAction() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)

        if findVitaminName(selectedRow: selectedRow) {
            vitaminTextField.text = vitaminNames[selectedRow]
            vitaminTextField.resignFirstResponder()
        }
        print(testBoxAndVitaminDataList)
    }
    
    private func findVitaminName(selectedRow: Int) -> Bool {
        var box = Int()
        var vseq = Int()
        let titleLabelIndex = titleLabel.text
        
        switch titleLabelIndex {
        case "1번 보관함":
            box = 1
        case "2번 보관함":
            box = 2
        case "3번 보관함":
            box = 3
        case "4번 보관함":
            box = 4
        case "5번 보관함":
            box = 5
        case "6번 보관함":
            box = 6
        default:
            break
        }
        
        if selectedRow != 0 {
            // 선택한 열의 영양제 vseq 찾기.
            vseq = userVitaminDataList[selectedRow-1].vseq
            
            // 만약 중복인지 검사
            for i in 0..<testBoxAndVitaminDataList.count {
                if testBoxAndVitaminDataList[i].vseq == vseq {
                    return false
                }
            }
            
            // 출력용
            let prod_name = userVitaminDataList[selectedRow-1].prod_name
            
            // 실제 반영
            testBoxAndVitaminDataList[box-1].vseq = vseq
            print("\(box)번 보관함, \(vseq)번 영양제 (\(prod_name))")
            
            return true
        } else {
            testBoxAndVitaminDataList[box-1].vseq = 0
            
            print("\(box)번 보관함, \(vseq)번 영양제 (선택안함)")
            return true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
        textFieldSetting()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyHomeBoxSettingCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vitaminNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vitaminNames[row]
    }
}
