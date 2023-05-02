//
//  AlarmAddViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit
import SnapKit

class alarmAddViewTableCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "설정"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor.clear
        textField.placeholder = "알림"
        textField.textColor = UIColor.darkGray
        textField.textAlignment = .right
        
        return textField
    }()
    
    
    private func layout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(10)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
