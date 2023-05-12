//
//  AlarmView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/01.
//

import UIKit

class AlarmView: UIView {
    
    func plusButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor.appPointColor
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }
    
    func emptyAlarmImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Quriosity")
        
        return imageView
    }
}
