//
//  AlarmBoxViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/31.
//
import UIKit
import SnapKit

class AlarmBoxViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.systemFont(ofSize: 17)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 17)
        
        return label
    }()
    
    let checkStateImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = UIColor.appPointColor
        
        return imageView
    }()
    
    private func layout() {
        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(10)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(12.5)
        }
        
        checkStateImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.trailing.equalTo(-15)
            make.size.equalTo(CGSize(width: 18, height: 20))
        }
    }
    
    private func addSubview() {
        contentViewList = [titleLabel, checkStateImageView]
        
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
