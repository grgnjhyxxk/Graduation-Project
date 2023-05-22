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
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.subTextColor
        textField.textAlignment = .left
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let ingredientsTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.subTextColor
        textField.textAlignment = .left
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let dosageTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.subTextColor
        textField.textAlignment = .left
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(12.5)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(100)
        }
        
        ingredientsTextField.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(nameTextField)
        }
        
        ingredientsTextField.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(nameTextField)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, nameTextField, ingredientsTextField, dosageTextField]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameTextField.isHidden = true
        ingredientsTextField.isHidden = true
        dosageTextField.isHidden = true
    }
    
    func hiddenFucntion(titleLabelText: String, nameTextFieldBool: Bool, ingredientsTextFieldBool: Bool, dosageTextFieldBool: Bool) {
        titleLabel.text = titleLabelText
        nameTextField.isHidden = nameTextFieldBool
        ingredientsTextField.isHidden = ingredientsTextFieldBool
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
