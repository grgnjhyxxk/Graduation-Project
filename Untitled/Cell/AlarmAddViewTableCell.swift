//
//  AlarmAddViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit
import SnapKit

class alarmAddViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
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
        textField.placeholder = "알람"
        textField.textColor = UIColor.placeholderText
        textField.textAlignment = .right
        textField.font = UIFont.boldSystemFont(ofSize: 17)
        
        return textField
    }()
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        
        repeatSwitch.isOn = false
        repeatSwitch.onTintColor = UIColor.applicationPointColorHighlightColor
        return repeatSwitch
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.leading.equalTo(12)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(10.5)
            make.trailing.equalTo(-10)
        }
        
        repeatSwitch.snp.makeConstraints { make in
            make.top.equalTo(6.5)
            make.trailing.equalTo(-10)
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, textField, repeatSwitch]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
    }
    
    private func allHidenInit() {
        textField.isHidden = true
        repeatSwitch.isHidden = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        layout()
        allHidenInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
