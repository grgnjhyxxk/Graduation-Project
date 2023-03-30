//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class homeViewController: UIViewController {
    
    let userProfileButton = mainView().roundingButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLayout()
        setSameBackgroundColor()
        
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(userProfileButton)
        
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
    }
}
