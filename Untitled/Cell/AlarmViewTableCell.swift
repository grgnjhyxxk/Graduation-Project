//
//  AlarmViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//
import UIKit
import SnapKit

class AlarmViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let userImage: UIImageView = {
        let imageView = UIImageView()
        let image = userProfileImageList[0].image
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor.clear
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "label"
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        
        return label
    }()
    
//    let userNameLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "username"
//        label.textColor = UIColor.appTextColor
//        label.font = UIFont.systemFont(ofSize: 10)
//        label.font = UIFont(name: "NotoSansKR-Regular", size: 10)
//
//        return label
//    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "10:30"
//        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 40)
        label.textColor = .appTextColor
        label.textAlignment = .right
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "date"
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.systemFont(ofSize: 11.5)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        
        return label
    }()
    
    let vitaminLabelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appPointColor
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private func layout() {
        userImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.leading.equalTo(contentView).offset(10)
            make.width.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(userImage).offset(5)
            make.leading.equalTo(userImage.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).offset(-150)
        }
        
//        userNameLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(0)
//            make.leading.equalTo(titleLabel).offset(1.5)
//        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(-20)
            make.trailing.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(-30)
            make.trailing.equalTo(timeLabel).offset(-2.5)
        }
        
        vitaminLabelButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
            make.width.equalTo(vitaminLabelButton.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
    }
    
    private func addSubview() {
        contentViewList = [userImage, titleLabel, timeLabel, dateLabel, vitaminLabelButton]
        
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

