//
//  RegisterView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/09.
//

import UIKit

class RegisterView: UIView {
    
    func mainTextLabel(setText: String) -> UIView {
        let label = UILabel()
        
        label.text = "\(setText)"
        label.textColor = UIColor.appTextColor
//        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 30)
        label.numberOfLines = 0
        
        return label
    }
    
    func subTextLabel(setText: String) -> UIView {
        let label = UILabel()
        
        label.text = "\(setText)"
        label.textColor = UIColor.appPointColor
//        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 13)
        
        return label
    }
    
    func textField(setPlaceholder: String) -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "\(setPlaceholder)"
        textField.textColor = UIColor.appTextColor
        textField.backgroundColor = UIColor.appSubBackgroundColor
        textField.layer.cornerRadius = 5
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 0.1
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        
        return textField
    }
    
    func genderSegmentedControl() -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: ["남자", "여자"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor.appMainBackgroundColor
        segmentedControl.layer.cornerRadius = 5
        segmentedControl.selectedSegmentTintColor = UIColor.appPointColor
        
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.8), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(1), NSAttributedString.Key.font: UIFont(name: "NotoSansKR-Bold", size: 15)!], for: .normal)

        return segmentedControl
    }
    
    func selectUserProfileImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.backgroundColor = UIColor.appSubBackgroundColor
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
//        imageView.layer.borderWidth = 5
//        imageView.layer.borderColor = UIColor.appPointColor?.cgColor
        
        return imageView
    }
    
    func warningLabel() -> UILabel {
        let label = UILabel()
        
        label.textColor = UIColor.systemRed
//        label.font = UIFont.systemFont(ofSize: 13)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        
        return label
    }
    
    func symbolImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "\(imageName)")
        
        return imageView
    }
}
