//
//  RepeatDaysSelectView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/04.
//

import UIKit

class repeatDaysSelectView: UIView {
    
    func titleLabel() -> UILabel {
        let label = UILabel()
            
        label.text = "반복"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }
    
    func backButton() -> UIButton {
        let button = UIButton()
        
        button.setTitle("뒤로", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return button
    }
}

