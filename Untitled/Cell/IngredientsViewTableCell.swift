//
//  IngredientsViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit
import SnapKit

class IngredientsViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.appTextColor
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    var middleDivideLineView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.systemGray3
        
        return view
    }()
    
    var leftView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    var rightView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.appTextColor
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    
    private func layout() {
        middleDivideLineView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView)
            make.height.equalTo(20)
            make.width.equalTo(1)
        }
        
        leftView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(middleDivideLineView.snp.leading)
            make.bottom.equalTo(contentView)
        }
        
        rightView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(middleDivideLineView.snp.trailing)
            make.trailing.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.centerX.equalTo(leftView)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.centerX.equalTo(rightView)
        }
    }
    
    private func addSubview() {
        contentViewList = [middleDivideLineView, leftView, rightView, nameLabel, contentLabel]
        
        contentView.backgroundColor = UIColor.appMainBackgroundColor
        for uiView in contentViewList {
            contentView.addSubview(uiView)
        }
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
