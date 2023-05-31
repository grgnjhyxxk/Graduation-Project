//
//  AlarmVitaminSelectViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/29.
//

import UIKit
import SnapKit

class AlarmVitaminSelectViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor.appTextColor
        label.font = UIFont.systemFont(ofSize: 17)
        
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
            make.top.equalTo(12)
            make.leading.equalTo(12.5)
        }
        
        checkStateImageView.snp.makeConstraints { make in
            make.top.equalTo(12)
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
    
    private func allHidenInit() {
        checkStateImageView.isHidden = true
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
