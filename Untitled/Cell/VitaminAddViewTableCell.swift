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
        textField.placeholder = "종합비타민"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let ingredientsTextLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = UIColor.clear
        label.text = "비타민A, 비타민B, 비타민C ..."
        label.textColor = UIColor.placeholderText
        label.textAlignment = .right
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let dosageTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.placeholder = "1일 1정"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
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
        
        dosageTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-10)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, greaterthan, nameTextField, ingredientsTextLabel, dosageTextField]
        
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
    }
    
    func hiddenFucntion(titleLabelText: String, nameTextFieldBool: Bool, ingredientsTextLabelBool: Bool, dosageTextFieldBool: Bool, greaterthanBool: Bool) {
        titleLabel.text = titleLabelText
        greaterthan.isHidden = greaterthanBool
        nameTextField.isHidden = nameTextFieldBool
        ingredientsTextLabel.isHidden = ingredientsTextLabelBool
        dosageTextField.isHidden = dosageTextFieldBool
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
