//
//  UserProfileEditViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/17.
//

import UIKit
import SnapKit

class UserProfileEditViewTableCell: UITableViewCell {
    
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
    
    let nameTextField: UILabel = {
        let textField = UILabel()
        
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.subTextColor
        textField.textAlignment = .left
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let birthTextLabel: UILabel = {
        let textField = UILabel()
        
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.subTextColor
        textField.textAlignment = .left
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return textField
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.subTextColor
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let serialNumberLabel: UILabel = {
        let label = UILabel()
        let intTostring = String(userDataList[0].serial_id)
        let text = CommonView().addDashesToString(string: intTostring)
        
        label.textColor = UIColor.placeholderText
        label.text = String(text)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(12.5)
        }
        
        greaterthan.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-12.5)
            make.size.equalTo(CGSize(width: 13, height: 23))
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(100)
        }
        
        birthTextLabel.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(nameTextField)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(nameTextField)
        }
        
        serialNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(9)
            make.leading.equalTo(nameTextField)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, greaterthan, nameTextField, birthTextLabel, genderLabel, serialNumberLabel]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameTextField.isHidden = true
        birthTextLabel.isHidden = true
        serialNumberLabel.isHidden = true
    }
    
    func hiddenFucntion(titleLabelText: String, nameTextFieldBool: Bool, birthTextLabelBool: Bool, genderLabelBool: Bool, serialNumberLabelBool: Bool, greaterthanBool: Bool) {
        titleLabel.text = titleLabelText
        nameTextField.isHidden = nameTextFieldBool
        birthTextLabel.isHidden = birthTextLabelBool
        genderLabel.isHidden = genderLabelBool
        serialNumberLabel.isHidden = serialNumberLabelBool
        
        greaterthan.isHidden = greaterthanBool
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
