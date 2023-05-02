//
//  AlarmViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//
import UIKit
import SnapKit

class alarmViewTableCell: UITableViewCell {
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor.white
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let brandLabel: UILabel = {
        let label = UILabel()
        
        label.text = "brand"
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
    
    private func layout() {
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(timeLabel)
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(contentView).offset(15)
            make.width.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView).offset(10)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(1)
            make.left.equalTo(titleLabel)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-10)
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

