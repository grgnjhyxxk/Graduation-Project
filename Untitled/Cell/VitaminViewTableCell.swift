//
//  VitaminViewTableCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/25.
//

import UIKit
import SnapKit

class VitaminViewTableCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
        
    let vitaminImage: UIImageView = {
        let imageView = UIImageView()
        let image = userProfileImageList[0].image
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = UIColor.appSubBackgroundColor
        
        return imageView
    }()
    
    let vitaminNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "label"
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 15)
        
        return label
    }()
    
    let brandLabel: UILabel = {
        let label = UILabel()
        
        label.text = "brand"
        label.textColor = UIColor.appTextColor
        label.font = UIFont.systemFont(ofSize: 10)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 10)
        
        return label
    }()
    
    let firstIngredientsLabelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appPointColor
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    let secondIngredientsLabelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminB1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appPointColor
        button.layer.cornerRadius = 10

        return button
    }()
    
    let thirdIngredientsLabelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminB2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appPointColor
        button.layer.cornerRadius = 10

        return button
    }()
    
    let checkButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.tintColor = UIColor.systemGray3
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }()
    
    let overCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = UIColor.appTextColor
        label.font = UIFont(name: "NotoSansKR-Regular", size: 10)
        
        return label
    }()
    
    private func layout() {
        vitaminImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.leading.equalTo(contentView).offset(10)
            make.width.height.equalTo(64)
        }
        
        vitaminNameLabel.snp.makeConstraints { make in
            make.top.equalTo(vitaminImage).offset(5)
            make.leading.equalTo(vitaminImage.snp.trailing).offset(10)
            make.trailing.lessThanOrEqualTo(contentView).offset(-36)
        }
        vitaminNameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        vitaminNameLabel.setContentHuggingPriority(.required, for: .horizontal)

//        brandLabel.snp.makeConstraints { make in
//            make.top.equalTo(vitaminNameLabel.snp.bottom).offset(0)
//            make.leading.equalTo(vitaminNameLabel).offset(1.5)
//        }
        
        firstIngredientsLabelButton.snp.makeConstraints { make in
            make.top.equalTo(vitaminNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(vitaminNameLabel)
            make.width.equalTo(firstIngredientsLabelButton.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
        
        secondIngredientsLabelButton.snp.makeConstraints { make in
            make.top.equalTo(firstIngredientsLabelButton).offset(0)
            make.leading.equalTo(firstIngredientsLabelButton.snp.trailing).offset(5)
            make.width.equalTo(secondIngredientsLabelButton.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
        
        thirdIngredientsLabelButton.snp.makeConstraints { make in
            make.top.equalTo(firstIngredientsLabelButton).offset(0)
            make.leading.equalTo(secondIngredientsLabelButton.snp.trailing).offset(5)
            make.width.equalTo(thirdIngredientsLabelButton.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
        
//        checkButton.snp.makeConstraints { make in
//            make.top.equalTo(vitaminNameLabel).offset(3)
////            make.trailing.equalTo(-10)
//            make.leading.equalTo(vitaminNameLabel.snp.trailing).offset(5)
//            make.size.equalTo(CGSize(width: 17, height: 17))
//        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(vitaminNameLabel).offset(3)
//            make.trailing.equalTo(-10)
            make.trailing.equalTo(-10)
            make.size.equalTo(CGSize(width: 17, height: 17))
        }
//
//        timeLabel.snp.makeConstraints { make in
//            make.top.equalTo(contentView).offset(-20)
//            make.trailing.equalTo(contentView).offset(-10)
//            make.bottom.equalTo(contentView).offset(-10)
//        }
//
//        dateLabel.snp.makeConstraints { make in
//            make.top.equalTo(timeLabel.snp.bottom).offset(-30)
//            make.trailing.equalTo(timeLabel).offset(-2.5)
//        }
    }
    
    private func addSubview() {
        contentViewList = [vitaminImage, vitaminNameLabel, brandLabel, firstIngredientsLabelButton, secondIngredientsLabelButton, thirdIngredientsLabelButton, checkButton, overCountLabel]
        
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
