//
//  UserView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/31.
//

import UIKit

class UserView: UIView {
    func arrowButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = UIColor.appPointColor
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }
}
