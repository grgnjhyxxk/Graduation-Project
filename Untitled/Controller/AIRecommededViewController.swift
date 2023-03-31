//
//  AIRecommededViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class aiRecommendedViewController: UIViewController {
    
    var uiViewList: [UIView] = []

    let userProfileButton = commonView().roundingButton()
    let envelopeButton = commonView().envelopeButton()
    let titleTextButton = commonView().titleTextButton(titleText: "맞춤추천")

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
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(31)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
    }
    
    private func addSubview() {
        uiViewList = [userProfileButton, envelopeButton, titleTextButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}
