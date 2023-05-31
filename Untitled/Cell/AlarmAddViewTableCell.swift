//
//  AlarmAddViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit
import SnapKit

class AlarmAddViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let greaterthan: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "greaterthan")
        imageView.tintColor = UIColor.placeholderText
        
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.placeholder = "알람"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
//        textField.font = UIFont.systemFont(ofSize: 17)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let repeatDaysLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.placeholderText
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let boxLabelHead: UILabel = {
        let label = UILabel()
        
        label.text = "보관함"
        label.textColor = UIColor.placeholderText
        label.textAlignment = .center

        return label
    }()
    
    let numOfBoxTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.text = "1"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let boxLabelTail: UILabel = {
        let label = UILabel()
        
        label.text = "번"
        label.textColor = UIColor.placeholderText
        label.textAlignment = .center

        return label
    }()
    
    let selectVitaminLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영양제"
        label.textColor = UIColor.placeholderText
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(10)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(12.5)
        }
        
        greaterthan.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
            make.size.equalTo(CGSize(width: 13, height: 23))
        }
        
        repeatDaysLabel.snp.makeConstraints { make in
//            make.top.equalTo(10.85)
//            make.top.equalTo(9)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(greaterthan.snp.leading).offset(-3)
        }
        
        textField.snp.makeConstraints { make in
//            make.top.equalTo(10.5)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
        }
        
        boxLabelHead.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(numOfBoxTextField.snp.leading).offset(-5)
        }
        
        numOfBoxTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView).offset(-1.6)
            make.trailing.equalTo(boxLabelTail.snp.leading).offset(-3)
        }
        
        boxLabelTail.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
        }
        
        selectVitaminLabel.snp.makeConstraints { make in
//            make.top.equalTo(10.85)
//            make.top.equalTo(9)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(greaterthan.snp.leading).offset(-3)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, greaterthan, textField, repeatDaysLabel, selectVitaminLabel, boxLabelHead, numOfBoxTextField, boxLabelTail]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    private func delegateFunction() {
        textField.delegate = self
        numOfBoxTextField.delegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.isHidden = true
        greaterthan.isHidden = true
        repeatDaysLabel.isHidden = true
        boxLabelHead.isHidden = true
        numOfBoxTextField.isHidden = true
        boxLabelTail.isHidden = true
        selectVitaminLabel.isHidden = true
    }
    
    func hiddenFucntion(titleLabelText: String, greaterthanBool: Bool, repeatDaysLabelBool: Bool, textFieldBool: Bool, boxLabelHeadBool: Bool, numOfBoxTextFieldBool: Bool, boxLabelTailBool: Bool, selectVitaminLabelBool: Bool) {
        titleLabel.text = titleLabelText
        greaterthan.isHidden = greaterthanBool
        repeatDaysLabel.isHidden = repeatDaysLabelBool
        textField.isHidden = textFieldBool
        boxLabelHead.isHidden = boxLabelHeadBool
        numOfBoxTextField.isHidden = numOfBoxTextFieldBool
        boxLabelTail.isHidden = boxLabelTailBool
        selectVitaminLabel.isHidden = selectVitaminLabelBool
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
        delegateFunction()
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        numOfBoxTextField.addTarget(self, action: #selector(numOfBoxTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        alarmTextFieldText = textField.text ?? "없음"
    }
    
    @objc func numOfBoxTextFieldDidChange(_ sender: Any?) {
        numOfBox = numOfBoxTextField.text ?? ""
    }
}

extension AlarmAddViewTableCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textField {
            textField.resignFirstResponder()
        }
        
        if textField == self.numOfBoxTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
