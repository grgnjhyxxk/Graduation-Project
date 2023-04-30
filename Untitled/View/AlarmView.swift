//
//  AlarmView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/01.
//

import UIKit

class alarmView: UIView {
    
    func listButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = UIColor.white
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }
    
    func plusButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.white
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }
}
