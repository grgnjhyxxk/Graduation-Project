//
//  CommonView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/01.
//

import UIKit

private let userProfileImageString = "TemporaryUserProfilePicture"

class commonView: UIView {
    
    func roundingImage(string: String) -> UIImage {
        let originalImage = UIImage(named: "\(string)")

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
    
    func roundingButton() -> UIView {
    
        let image = roundingImage(string: userProfileImageString)
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 22.5
        button.appButtonCommonStyle()
        
        return button
    }
    
    func envelopeButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "envelope.fill"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.white
        button.appButtonCommonStyle()
        
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
        label.font = UIFont.systemFont(ofSize: size)
        label.labelTextCommonStyle()
        
        return label
    }
    
    func scrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = UIColor(white: 1.0, alpha: 0.22)
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor(white: 1.0, alpha: 0.14).cgColor
        scrollView.layer.cornerRadius = 30
        
        return scrollView
    }
}