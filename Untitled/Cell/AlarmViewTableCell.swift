//
//  AlarmViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//
import UIKit
import SnapKit

class alarmViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let userImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor.alarmViewUserImageBaseColor
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "label"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "username"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "10:30"
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.textColor = .white
        label.textAlignment = .right
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "date"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11.5)
        
        return label
    }()
    
    private func layout() {
        userImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(contentView).offset(15)
            make.width.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(userImage).offset(10)
            make.left.equalTo(userImage.snp.right).offset(10)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(1)
            make.left.equalTo(titleLabel)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(-18)
            make.trailing.equalTo(timeLabel).offset(-2.5)
        }
    }
    
    private func addSubview() {
        contentViewList = [userImage, titleLabel, userNameLabel, timeLabel, dateLabel]
        
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

