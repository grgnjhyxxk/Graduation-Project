//
//  MainView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class mainView: UIView {
    
    func userProfileImage() -> UIImage {
        let originalImage = UIImage(named: "TemporaryUserProfilePicture")

        // 이미지 크기와 동일한 새로운 이미지 생성
        let imageFrame = CGRect(x: 0, y: 0, width: originalImage!.size.width, height: originalImage!.size.height)
        UIGraphicsBeginImageContextWithOptions(imageFrame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        UIBezierPath(roundedRect: imageFrame, cornerRadius: imageFrame.size.width/2.0).addClip()
        originalImage?.draw(in: imageFrame)
        context?.restoreGState()
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return roundedImage
    }
    func userProfileButton() -> UIView {
    
        let image = userProfileImage()
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 22.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0.5, height: 3)
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        button.layer.borderWidth = 1.8
        button.layer.borderColor = UIColor(red: 133/255, green: 185/255, blue: 255/255, alpha: 0.45).cgColor
        return button
        
    }
}
