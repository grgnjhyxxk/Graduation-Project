//
//  InitView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class initView: UIView {
    
    func mainTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "더 편리하고\n가볍게"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        
        return label
    }
}
