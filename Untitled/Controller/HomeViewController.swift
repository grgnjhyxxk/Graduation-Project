//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class homeViewController: UIViewController {
    
    var uiViewList: [UIView] = []

    let userProfileButton = mainView().roundingButton()
    let appIconForViewImageView = mainView().appIconForViewImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor()
        addSubview()
        viewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        appIconForViewImageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.leading.equalTo(view).offset(31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
    }
    
    private func addSubview() {
        uiViewList = [userProfileButton, appIconForViewImageView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}
