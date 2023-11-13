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

        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor.appMainBackgroundColor
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill

        return button
    }
    
    func userProfileImageView() -> UIImageView {
        let imageView = UIImageView()
        let image = userProfileImageList[0].image
//        let image = UIImage()

        imageView.image = image
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
    
    func subtitleTextButton(titleText: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle("\(titleText)", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        button.setTitleColor(UIColor.appTextColor, for: .normal)
        button.backgroundColor = UIColor.appSubBackgroundColor
        button.layer.cornerRadius = 20
        
        return button
    }
    
    func subTextButton() -> UILabel {
        let button = UILabel()
        
        button.backgroundColor = UIColor.appMainBackgroundColor
        button.textAlignment = .left
        button.textColor = UIColor.appTextColor
        button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.numberOfLines = 0
        button.lineBreakMode = .byCharWrapping

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
    
    func scrollView(backgroundColor: UIColor, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) -> UIScrollView {
        let uiView = UIScrollView()
  
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
    
    func deleteButton(text: String) -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.appSubBackgroundColor
        button.setTitle("\(text)", for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.07).cgColor
        
        return button
    }
    
    func createButton(text: String) -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.appSubBackgroundColor
        button.setTitle("\(text)", for: .normal)
        button.setTitleColor(UIColor.appTextColor, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.07).cgColor
        
        return button
    }
    
    func commonTitleButton(text: String) -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = UIColor.appPointColor
        button.setTitle("\(text)", for: .normal)
        button.setTitleColor(UIColor.appTextColor, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.5)
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        button.titleLabel?.textAlignment = .center
        
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
    
    func genderToString(list: Array<Any>) -> String {
        var gender = String()
        
        if userEditProfileDList[0].gender == 1 {
            gender = "남자"
        } else {
            gender = "여자"
        }
        
        return gender
    }
    
    func addDashesToString(string: String) -> String {
        let charArray = Array(string)  // 문자열을 문자 배열로 변환합니다.
        var result = ""
        
        for (index, char) in charArray.enumerated() {
            if index > 0 && index % 4 == 0 {
                result.append("-")  // 4자리마다 "-"를 추가합니다.
            }
            result.append(char)
        }
        
        return result
    }
}
