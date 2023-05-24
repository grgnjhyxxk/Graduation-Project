//
//  VitaminAddViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit
import SnapKit

// 영양제 이름
// 영양제 성분
// 영양제 섭취량

class VitaminAddViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let greaterthan: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "greaterthan")
        imageView.tintColor = UIColor.placeholderText
        
        return imageView
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.placeholder = "영양제"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let ingredientsTextLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = UIColor.clear
        label.text = "없음"
        label.textColor = UIColor.placeholderText
        label.textAlignment = .right
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let unitLabel: UILabel = {
        let label = UILabel()
        
        label.text = "하루"
        label.textColor = UIColor.placeholderText
        label.textAlignment = .center

        return label
    }()

    
    let dosageTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.text = "1"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let pillLabel: UILabel = {
        let label = UILabel()
        
        label.text = "알"
        label.textColor = UIColor.placeholderText
        label.textAlignment = .center

        return label
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(12.5)
        }
        
        greaterthan.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
            make.size.equalTo(CGSize(width: 13, height: 23))
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
        }
        
        ingredientsTextLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(greaterthan.snp.leading).offset(-3)
        }
        
        unitLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(dosageTextField.snp.leading).offset(-5)
        }
        
        dosageTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView).offset(-1.6)
            make.trailing.equalTo(pillLabel.snp.leading).offset(-3)
        }
        
        pillLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, greaterthan, nameTextField, ingredientsTextLabel, dosageTextField, unitLabel, pillLabel]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        greaterthan.isHidden = true
        nameTextField.isHidden = true
        ingredientsTextLabel.isHidden = true
        dosageTextField.isHidden = true
        unitLabel.isHidden = true
        pillLabel.isHidden = true
    }
    
    func hiddenFucntion(titleLabelText: String, nameTextFieldBool: Bool, ingredientsTextLabelBool: Bool, dosageTextFieldBool: Bool, greaterthanBool: Bool, unitLabelBool: Bool, pillLabelBool: Bool) {
        titleLabel.text = titleLabelText
        greaterthan.isHidden = greaterthanBool
        nameTextField.isHidden = nameTextFieldBool
        ingredientsTextLabel.isHidden = ingredientsTextLabelBool
        dosageTextField.isHidden = dosageTextFieldBool
        unitLabel.isHidden = unitLabelBool
        pillLabel.isHidden = pillLabelBool
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
        dosageTextField.addTarget(self, action: #selector(dosageTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func nameTextFieldDidChange(_ sender: Any?) {
        vitaminNameTextFieldText = nameTextField.text ?? "없음"
    }
    
    @objc func dosageTextFieldDidChange(_ sender: Any?) {
        perdayTextFieldText = dosageTextField.text ?? "없음"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
