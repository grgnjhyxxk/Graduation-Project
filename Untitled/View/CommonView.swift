//
//  CommonView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/01.
//

import UIKit

class CommonView: UIView {
    
    func roundingButton() -> UIButton {
        let button = UIButton()
        
        let image = userProfileImageList[0].image
//        button.setImage(UIImage(named: "TemporaryUserProfilePicture"), for: .normal)
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor.appMainBackgroundColor
        button.layer.cornerRadius = 22.5
        button.clipsToBounds = true
        
        return button
    }
    
    func userProfileImageView() -> UIImageView {
        let imageView = UIImageView()
//        let image = userProfileImageList[0].image
//
//        imageView.image = image
        imageView.backgroundColor = UIColor.appSubBackgroundColor
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
    
    func userInterfaceStyleToggleButton() -> UIButton {
        let button = UIButton()
        
        if traitCollection.userInterfaceStyle == .dark {
            button.setImage(UIImage(systemName: "moon.circle.fill"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "sun.max.circle.fill"), for: .normal)
        }
        
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.appPointColor
        
        return button
    }
    
    func titleTextButton(titleText: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle("\(titleText)", for: .normal)
        button.titleButtonCommonStyle()
        
        return button
    }
    
    func commonTextLabel(labelText: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.text = "\(labelText)"
//        label.font = UIFont.systemFont(ofSize: size)
        label.font = UIFont(name: "NotoSansKR-Regular", size: size)
        label.numberOfLines = 0
        label.labelTextCommonStyle()
        
        return label
    }
    
    func commonUiView(backgroundColor: UIColor, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) -> UIView {
        let uiView = UIView()
  
        uiView.backgroundColor = backgroundColor
        uiView.layer.borderWidth = borderWidth
        uiView.layer.borderColor = borderColor.cgColor
        uiView.layer.cornerRadius = cornerRadius
        
        return uiView
    }
    
    func radioButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = UIColor.systemGray3
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }
    
    func birthToDate(birth: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        if let date = dateFormatter.date(from: birth) {
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            let formattedBirthday = dateFormatter.string(from: date)
            return formattedBirthday
        } else {
            return "Invalid birthday format"
        }
    }
    
    func genderToString() -> String {
        var gender = String()
        
        if userDataList[0].gender == 1 {
            gender = "남자"
        } else {
            gender = "여자"
        }
        
        return gender
    }
}
