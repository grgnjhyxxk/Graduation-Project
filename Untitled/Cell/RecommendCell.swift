//
//  RecommendCell.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/03.
//

import UIKit
import SnapKit

class RecommendCell: UITableViewCell {
    
    var contentViewList: [UIView] = []
    
    let vitaminNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "label"
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 17)
        
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
    
    let overCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = UIColor.appTextColor
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        
        return label
    }()
    
    let firstIngredientsLabelButton_2: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.subTextColor
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    let secondIngredientsLabelButton_2: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminB1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.subTextColor
        button.layer.cornerRadius = 10

        return button
    }()
    
    let thirdIngredientsLabelButton_2: UIButton = {
        let button = UIButton()
        
        button.setTitle("vitaminB2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.subTextColor
        button.layer.cornerRadius = 10

        return button
    }()
    
    let overCountLabel_2: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = UIColor.appTextColor
        label.font = UIFont(name: "NotoSansKR-Bold", size: 12)
        
        return label
    }()
    
    private func layout() {
        vitaminNameLabel.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.leading.equalTo(10)
            make.trailing.lessThanOrEqualTo(contentView).offset(-36)
        }
        vitaminNameLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        vitaminNameLabel.setContentHuggingPriority(.required, for: .horizontal)

        
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
        
        firstIngredientsLabelButton_2.snp.makeConstraints { make in
            make.top.equalTo(firstIngredientsLabelButton.snp.bottom).offset(7)
            make.leading.equalTo(vitaminNameLabel)
            make.width.equalTo(firstIngredientsLabelButton_2.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
        
        secondIngredientsLabelButton_2.snp.makeConstraints { make in
            make.top.equalTo(firstIngredientsLabelButton_2).offset(0)
            make.leading.equalTo(firstIngredientsLabelButton_2.snp.trailing).offset(5)
            make.width.equalTo(secondIngredientsLabelButton_2.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
        
        thirdIngredientsLabelButton_2.snp.makeConstraints { make in
            make.top.equalTo(secondIngredientsLabelButton_2).offset(0)
            make.leading.equalTo(secondIngredientsLabelButton_2.snp.trailing).offset(5)
            make.width.equalTo(thirdIngredientsLabelButton_2.titleLabel!.snp.width).offset(20)
            make.height.equalTo(20)
        }
    }
    
    private func addSubview() {
        contentViewList = [vitaminNameLabel, brandLabel, firstIngredientsLabelButton, secondIngredientsLabelButton, thirdIngredientsLabelButton, overCountLabel, firstIngredientsLabelButton_2, secondIngredientsLabelButton_2, thirdIngredientsLabelButton_2, overCountLabel_2]
        
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
