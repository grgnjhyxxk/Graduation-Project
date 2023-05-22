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
    
    let userSelectLabel: UILabel = {
        let label = UILabel()
        
        label.text = "사용자"
        label.textColor = UIColor.placeholderText
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
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
        
        userSelectLabel.snp.makeConstraints { make in
//            make.top.equalTo(10.85)
//            make.top.equalTo(9)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(greaterthan.snp.leading).offset(-3)
        }
        
        selectVitaminLabel.snp.makeConstraints { make in
//            make.top.equalTo(10.85)
//            make.top.equalTo(9)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(greaterthan.snp.leading).offset(-3)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, greaterthan, textField, repeatDaysLabel, userSelectLabel, selectVitaminLabel]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    private func delegateFunction() {
        textField.delegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.isHidden = true
        greaterthan.isHidden = true
        repeatDaysLabel.isHidden = true
        userSelectLabel.isHidden = true
        selectVitaminLabel.isHidden = true
    }
    
    func hiddenFucntion(titleLabelText: String, greaterthanBool: Bool, repeatDaysLabelBool: Bool, textFieldBool: Bool, userSelectLabelBool: Bool, selectVitaminLabelBool: Bool) {
        titleLabel.text = titleLabelText
        greaterthan.isHidden = greaterthanBool
        repeatDaysLabel.isHidden = repeatDaysLabelBool
        textField.isHidden = textFieldBool
        userSelectLabel.isHidden = userSelectLabelBool
        selectVitaminLabel.isHidden = selectVitaminLabelBool
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
        delegateFunction()
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        alarmTextFieldText = textField.text ?? "없음"
    }
}

extension AlarmAddViewTableCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
