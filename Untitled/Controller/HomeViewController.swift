//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var uiViewList: [UIView] = []

    let userProfileButton = CommonView().roundingButton()
    let appIconForViewImageView = MainView().appIconForViewImageView()
    let envelopeButton = CommonView().envelopeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
        appIconForViewImageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.leading.equalTo(view).offset(31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
    }
    
    private func addSubview() {
        uiViewList = [appIconForViewImageView, userProfileButton, envelopeButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}
